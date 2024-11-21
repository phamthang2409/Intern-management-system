using HtmlAgilityPack;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Management;
using System.Net.Sockets;
using System.Net;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoUDPChatGUI
{
    public partial class FrmServer : Form
    {
        public FrmServer()
        {
            InitializeComponent();
        }

        //Khai bao socket
        Socket sckServer;
        EndPoint epClient;
        IPEndPoint epServer;

        private void butKhoitao_Click(object sender, EventArgs e)
        {
            //Tao socket
            sckServer = new Socket(AddressFamily.InterNetwork, SocketType.Dgram, ProtocolType.Udp);

            //Bind
            epServer = new IPEndPoint(IPAddress.Any, (int)numServerPort.Value);
            sckServer.Bind(epServer);

            //Cho nhan du lieu tu client
            epClient = new IPEndPoint(IPAddress.Any, 0);
            EndPoint tmpEP = (EndPoint)epClient;

            //Cap nhat trang thai
            lbTrangThai.Text = "Dang cho ket noi ...";

            //Bat dau nhan du lieu
            sckServer.BeginReceiveFrom(data, 0, 1024, SocketFlags.None, ref tmpEP, new AsyncCallback(xulydulieunhanduoc), tmpEP);
        }

        //Khai bao bo dem de nhan du lieu
        byte[] data = new byte[1024];

        void xulydulieunhanduoc(IAsyncResult result)
        {
            EndPoint tmpEP = new IPEndPoint(IPAddress.Any, 0);
            int size = sckServer.EndReceiveFrom(result, ref tmpEP);

            //Xu ly du lieu nhan duoc trong data[]
            string thongdiep = Encoding.ASCII.GetString(data, 0, size);

            //Chen thong diep vao textbox noidungchat
            txtNoidungChat.Invoke(new CapNhatGiaoDien(CapNhatNoiDungChat), new object[] { "Client: " + thongdiep });

            //Cap nhat trang thai
            CapNhatTrangThai(thongdiep);

            //Gui phan hoi lai client
            string response = XuLyThongDiep(thongdiep);
            byte[] responseData = Encoding.ASCII.GetBytes(response);
            sckServer.SendTo(responseData, tmpEP);

            //Cho nhan tiep
            sckServer.BeginReceiveFrom(data, 0, 1024, SocketFlags.None, ref tmpEP, new AsyncCallback(xulydulieunhanduoc), tmpEP);
        }

        delegate void CapNhatGiaoDien(string s);
        void CapNhatTrangThai(string s)
        {
            if (s == "1" )
            {
                DateTime dateTime = DateTime.Now;
                s = dateTime.ToString();
            }
            else if (s == "2" )
            {
                try
                {
                    ManagementObjectSearcher searcher = new ManagementObjectSearcher(@"root\WMI", "SELECT * FROM MSAcpi_ThermalZoneTemperature");
                    foreach (ManagementObject obj in searcher.Get())
                    {
                        double temp = Convert.ToDouble(obj["CurrentTemperature"].ToString());
                        // Convert the temperature to Celsius
                        temp = (temp - 2732) / 10.0;
                        s = temp.ToString();
                        s = s.Trim();
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine($"An error occurred: {e.Message}");
                }
            }
            else if (s == "3" )
            {
                var url = "https://ut.edu.vn/";
                var web = new HtmlWeb();
                var doc = web.Load(url);
                // Giả sử tiêu đề bài báo nằm trong thẻ <h1>
                var titleNode = doc.DocumentNode.SelectSingleNode("//h3");
                if (titleNode != null)
                {
                    Console.WriteLine("Tiêu đề bài báo: " + titleNode.InnerText);
                    s = titleNode.InnerText;
                    s.Trim();
                }
                else
                {
                    Console.WriteLine("Không tìm thấy tiêu đề bài báo.");
                }
            }
            CapNhatNoiDungChat("Server: " + s);
        }

        string XuLyThongDiep(string thongdiep)
        {
            if (thongdiep == "1" )
            {
                return DateTime.Now.ToString();
            }
            else if (thongdiep == "2" )
            {
                try
                {
                    ManagementObjectSearcher searcher = new ManagementObjectSearcher(@"root\WMI", "SELECT * FROM MSAcpi_ThermalZoneTemperature");
                    foreach (ManagementObject obj in searcher.Get())
                    {
                        double temp = Convert.ToDouble(obj["CurrentTemperature"].ToString());
                        // Convert the temperature to Celsius
                        temp = (temp - 2732) / 10.0;
                        return temp.ToString().Trim();
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine($"An error occurred: {e.Message}");
                    return "Error retrieving temperature";
                }
            }
            else if (thongdiep == "3" )
            {
                var url = "https://ut.edu.vn/";
                var web = new HtmlWeb();
                var doc = web.Load(url);
                // Giả sử tiêu đề bài báo nằm trong thẻ <h3>
                var titleNode = doc.DocumentNode.SelectSingleNode("//h3");
                if (titleNode != null)
                {
                    Console.WriteLine("Tiêu đề bài báo: " + titleNode.InnerText);
                    return titleNode.InnerText.Trim();
                }
                else
                {
                    Console.WriteLine("Không tìm thấy tiêu đề bài báo.");
                    return "Không tìm thấy tiêu đề bài báo.";
                }
            }
            return "Ngoài phạm vi phục vụ của Tôi!";
        }

        void CapNhatNoiDungChat(string s)
        {
            txtNoidungChat.Text += s + "\r\n";
        }

        private void butGui_Click(object sender, EventArgs e)
        {
            byte[] message = Encoding.ASCII.GetBytes(txtThongdiep.Text);
            sckServer.SendTo(message, epClient);
            CapNhatNoiDungChat("Server: " + txtThongdiep.Text);
            txtThongdiep.Text = "";
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
