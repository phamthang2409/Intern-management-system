using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoUDPChatGUI
{
    public partial class FrmClient : Form
    {
        public FrmClient()
        {
            InitializeComponent();
        }

        Socket sckClient;
        EndPoint epServer;

        private void butKetnoi_Click(object sender, EventArgs e)
        {
            // Tạo socket
            sckClient = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);

            // Thiết lập điểm cuối của server
            epServer = new IPEndPoint(IPAddress.Parse(txtServerIP.Text), (int)numServerPort.Value);

            // Cập nhật trạng thái kết nối
            CapNhatTrangThai("Kết nối với server UDP đã được thiết lập.");
        }

        // Khai báo bộ đệm để nhận dữ liệu
        byte[] data = new byte[1024];

        void xulydulieunhanduoc(IAsyncResult result)
        {
            EndPoint epSender = new IPEndPoint(IPAddress.Any, 0);

            // Gọi hàm EndReceiveFrom
            int size = sckClient.EndReceiveFrom(result, ref epSender);

            // Xử lý dữ liệu nhận được trong data[]
            string thongdiep = Encoding.ASCII.GetString(data, 0, size);

            // Chèn thông điệp vào textbox noidungchat
            txtNoidungChat.Invoke(new CapNhatGiaoDien(CapNhatNoiDungChat), new object[] { "Server: " + thongdiep });

            // Chờ nhận tiếp
            sckClient.BeginReceiveFrom(data, 0, 1024, SocketFlags.None, ref epSender, new AsyncCallback(xulydulieunhanduoc), null);
        }

        delegate void CapNhatGiaoDien(string s);

        void CapNhatTrangThai(string s)
        {
            lbTrangThai.Text = s;
        }

        void CapNhatNoiDungChat(string s)
        {
            txtNoidungChat.Text += s + "\r\n";
        }

        private void butGui_Click(object sender, EventArgs e)
        {
            byte[] message = Encoding.ASCII.GetBytes(txtThongdiep.Text);

            // Gửi thông điệp đến server
            sckClient.SendTo(message, epServer);
            CapNhatNoiDungChat("Client: " + txtThongdiep.Text);
            txtThongdiep.Text = "";

            // Bắt đầu nhận dữ liệu
            EndPoint epSender = new IPEndPoint(IPAddress.Any, 0);
            sckClient.BeginReceiveFrom(data, 0, 1024, SocketFlags.None, ref epSender, new AsyncCallback(xulydulieunhanduoc), null);
        }

        private void txtThongdiep_KeyPress(object sender, KeyPressEventArgs e)
        {
            if ((int)e.KeyChar == 13)
            {
                // Gọi lại hàm gửi
                butGui_Click(null, null);
            }
        }
    }
}
