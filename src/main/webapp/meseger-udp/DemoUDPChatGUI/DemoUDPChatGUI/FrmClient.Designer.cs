namespace DemoUDPChatGUI
{
    partial class FrmClient
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.txtServerIP = new System.Windows.Forms.TextBox();
            this.numServerPort = new System.Windows.Forms.NumericUpDown();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.butKetnoi = new System.Windows.Forms.Button();
            this.lbTrangThai = new System.Windows.Forms.Label();
            this.txtNoidungChat = new System.Windows.Forms.TextBox();
            this.txtThongdiep = new System.Windows.Forms.TextBox();
            this.butGui = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.numServerPort)).BeginInit();
            this.SuspendLayout();
            // 
            // txtServerIP
            // 
            this.txtServerIP.Location = new System.Drawing.Point(147, 33);
            this.txtServerIP.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.txtServerIP.Name = "txtServerIP";
            this.txtServerIP.Size = new System.Drawing.Size(204, 26);
            this.txtServerIP.TabIndex = 0;
            this.txtServerIP.Text = "127.0.0.1";
            // 
            // numServerPort
            // 
            this.numServerPort.Location = new System.Drawing.Point(429, 33);
            this.numServerPort.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.numServerPort.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.numServerPort.Name = "numServerPort";
            this.numServerPort.Size = new System.Drawing.Size(122, 26);
            this.numServerPort.TabIndex = 1;
            this.numServerPort.Value = new decimal(new int[] {
            12345,
            0,
            0,
            0});
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(28, 36);
            this.label1.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(74, 20);
            this.label1.TabIndex = 2;
            this.label1.Text = "Server IP";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(372, 38);
            this.label2.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(38, 20);
            this.label2.TabIndex = 3;
            this.label2.Text = "Port";
            // 
            // butKetnoi
            // 
            this.butKetnoi.Location = new System.Drawing.Point(597, 31);
            this.butKetnoi.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.butKetnoi.Name = "butKetnoi";
            this.butKetnoi.Size = new System.Drawing.Size(99, 32);
            this.butKetnoi.TabIndex = 4;
            this.butKetnoi.Text = "Ket noi";
            this.butKetnoi.UseVisualStyleBackColor = true;
            this.butKetnoi.Click += new System.EventHandler(this.butKetnoi_Click);
            // 
            // lbTrangThai
            // 
            this.lbTrangThai.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTrangThai.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbTrangThai.Location = new System.Drawing.Point(6, 84);
            this.lbTrangThai.Name = "lbTrangThai";
            this.lbTrangThai.Size = new System.Drawing.Size(729, 35);
            this.lbTrangThai.TabIndex = 5;
            this.lbTrangThai.Text = "Chua ket noi";
            this.lbTrangThai.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtNoidungChat
            // 
            this.txtNoidungChat.Location = new System.Drawing.Point(6, 122);
            this.txtNoidungChat.Multiline = true;
            this.txtNoidungChat.Name = "txtNoidungChat";
            this.txtNoidungChat.Size = new System.Drawing.Size(728, 228);
            this.txtNoidungChat.TabIndex = 6;
            // 
            // txtThongdiep
            // 
            this.txtThongdiep.Location = new System.Drawing.Point(6, 365);
            this.txtThongdiep.Name = "txtThongdiep";
            this.txtThongdiep.Size = new System.Drawing.Size(569, 26);
            this.txtThongdiep.TabIndex = 7;
            this.txtThongdiep.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtThongdiep_KeyPress);
            // 
            // butGui
            // 
            this.butGui.Location = new System.Drawing.Point(597, 357);
            this.butGui.Name = "butGui";
            this.butGui.Size = new System.Drawing.Size(118, 38);
            this.butGui.TabIndex = 8;
            this.butGui.Text = "Gui";
            this.butGui.UseVisualStyleBackColor = true;
            this.butGui.Click += new System.EventHandler(this.butGui_Click);
            // 
            // FrmClient
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(747, 418);
            this.Controls.Add(this.butGui);
            this.Controls.Add(this.txtThongdiep);
            this.Controls.Add(this.txtNoidungChat);
            this.Controls.Add(this.lbTrangThai);
            this.Controls.Add(this.butKetnoi);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.numServerPort);
            this.Controls.Add(this.txtServerIP);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4, 5, 4, 5);
            this.Name = "FrmClient";
            this.Text = "2251320024 - Trần Ngọc Phước";
            ((System.ComponentModel.ISupportInitialize)(this.numServerPort)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtServerIP;
        private System.Windows.Forms.NumericUpDown numServerPort;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button butKetnoi;
        private System.Windows.Forms.Label lbTrangThai;
        private System.Windows.Forms.TextBox txtNoidungChat;
        private System.Windows.Forms.TextBox txtThongdiep;
        private System.Windows.Forms.Button butGui;
    }
}