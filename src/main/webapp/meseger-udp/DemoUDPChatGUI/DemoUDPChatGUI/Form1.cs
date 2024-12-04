using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DemoUDPChatGUI
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void butThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void butOK_Click(object sender, EventArgs e)
        {
            //Xu ly cho nut OK
            //kiem tra lua chon cua user
            if (radClient.Checked)
            {
                //Mo form client
                FrmClient frm = new FrmClient();
                frm.ShowDialog();
            }
            else
            {
                //Mo form server
                FrmServer frm = new FrmServer();
                frm.ShowDialog();
            }
        }
    }
}
