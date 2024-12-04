namespace DemoUDPChatGUI
{
    partial class FrmServer
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
            this.butKhoitao = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.numServerPort = new System.Windows.Forms.NumericUpDown();
            this.butGui = new System.Windows.Forms.Button();
            this.txtThongdiep = new System.Windows.Forms.TextBox();
            this.txtNoidungChat = new System.Windows.Forms.TextBox();
            this.lbTrangThai = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.numServerPort)).BeginInit();
            this.SuspendLayout();
            // 
            // butKhoitao
            // 
            this.butKhoitao.Location = new System.Drawing.Point(451, 17);
            this.butKhoitao.Margin = new System.Windows.Forms.Padding(6, 8, 6, 8);
            this.butKhoitao.Name = "butKhoitao";
            this.butKhoitao.Size = new System.Drawing.Size(190, 37);
            this.butKhoitao.TabIndex = 7;
            this.butKhoitao.Text = "Khoi tao server";
            this.butKhoitao.UseVisualStyleBackColor = true;
            this.butKhoitao.Click += new System.EventHandler(this.butKhoitao_Click);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 29);
            this.label2.Margin = new System.Windows.Forms.Padding(6, 0, 6, 0);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(157, 20);
            this.label2.TabIndex = 6;
            this.label2.Text = "Server chay tren Port";
            // 
            // numServerPort
            // 
            this.numServerPort.Location = new System.Drawing.Point(222, 24);
            this.numServerPort.Margin = new System.Windows.Forms.Padding(6, 8, 6, 8);
            this.numServerPort.Maximum = new decimal(new int[] {
            65535,
            0,
            0,
            0});
            this.numServerPort.Name = "numServerPort";
            this.numServerPort.Size = new System.Drawing.Size(181, 26);
            this.numServerPort.TabIndex = 5;
            this.numServerPort.Value = new decimal(new int[] {
            12345,
            0,
            0,
            0});
            // 
            // butGui
            // 
            this.butGui.Location = new System.Drawing.Point(603, 344);
            this.butGui.Name = "butGui";
            this.butGui.Size = new System.Drawing.Size(118, 38);
            this.butGui.TabIndex = 12;
            this.butGui.Text = "Gui";
            this.butGui.UseVisualStyleBackColor = true;
            this.butGui.Click += new System.EventHandler(this.butGui_Click);
            // 
            // txtThongdiep
            // 
            this.txtThongdiep.Location = new System.Drawing.Point(12, 352);
            this.txtThongdiep.Name = "txtThongdiep";
            this.txtThongdiep.Size = new System.Drawing.Size(569, 26);
            this.txtThongdiep.TabIndex = 11;
            this.txtThongdiep.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtThongdiep_KeyPress);
            // 
            // txtNoidungChat
            // 
            this.txtNoidungChat.Location = new System.Drawing.Point(12, 109);
            this.txtNoidungChat.Multiline = true;
            this.txtNoidungChat.Name = "txtNoidungChat";
            this.txtNoidungChat.Size = new System.Drawing.Size(728, 228);
            this.txtNoidungChat.TabIndex = 10;
            // 
            // lbTrangThai
            // 
            this.lbTrangThai.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left)
            | System.Windows.Forms.AnchorStyles.Right)));
            this.lbTrangThai.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(255)))), ((int)(((byte)(192)))));
            this.lbTrangThai.BorderStyle = System.Windows.Forms.BorderStyle.Fixed3D;
            this.lbTrangThai.Location = new System.Drawing.Point(12, 71);
            this.lbTrangThai.Name = "lbTrangThai";
            this.lbTrangThai.Size = new System.Drawing.Size(723, 35);
            this.lbTrangThai.TabIndex = 9;
            this.lbTrangThai.Text = "Chua ket noi";
            this.lbTrangThai.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // FrmServer
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(9F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(747, 400);
            this.Controls.Add(this.butGui);
            this.Controls.Add(this.txtThongdiep);
            this.Controls.Add(this.txtNoidungChat);
            this.Controls.Add(this.lbTrangThai);
            this.Controls.Add(this.butKhoitao);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.numServerPort);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Margin = new System.Windows.Forms.Padding(4);
            this.Name = "FrmServer";
            this.Text = "2251320024 - Trần Ngọc Phước";
            ((System.ComponentModel.ISupportInitialize)(this.numServerPort)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button butKhoitao;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.NumericUpDown numServerPort;
        private System.Windows.Forms.Button butGui;
        private System.Windows.Forms.TextBox txtThongdiep;
        private System.Windows.Forms.TextBox txtNoidungChat;
        private System.Windows.Forms.Label lbTrangThai;
    }
}