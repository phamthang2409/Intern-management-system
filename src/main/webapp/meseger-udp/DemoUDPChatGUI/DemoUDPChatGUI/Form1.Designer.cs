namespace DemoUDPChatGUI
{
    partial class Form1
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
            this.radClient = new System.Windows.Forms.RadioButton();
            this.radServer = new System.Windows.Forms.RadioButton();
            this.butOK = new System.Windows.Forms.Button();
            this.butThoat = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // radClient
            // 
            this.radClient.AutoSize = true;
            this.radClient.Checked = true;
            this.radClient.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radClient.Location = new System.Drawing.Point(74, 35);
            this.radClient.Name = "radClient";
            this.radClient.Size = new System.Drawing.Size(215, 29);
            this.radClient.TabIndex = 0;
            this.radClient.TabStop = true;
            this.radClient.Text = "Chay o che do Client";
            this.radClient.UseVisualStyleBackColor = true;
            // 
            // radServer
            // 
            this.radServer.AutoSize = true;
            this.radServer.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.radServer.Location = new System.Drawing.Point(74, 73);
            this.radServer.Name = "radServer";
            this.radServer.Size = new System.Drawing.Size(223, 29);
            this.radServer.TabIndex = 1;
            this.radServer.Text = "Chay o che do Server";
            this.radServer.UseVisualStyleBackColor = true;
            // 
            // butOK
            // 
            this.butOK.Location = new System.Drawing.Point(48, 167);
            this.butOK.Name = "butOK";
            this.butOK.Size = new System.Drawing.Size(118, 43);
            this.butOK.TabIndex = 2;
            this.butOK.Text = "OK";
            this.butOK.UseVisualStyleBackColor = true;
            this.butOK.Click += new System.EventHandler(this.butOK_Click);
            // 
            // butThoat
            // 
            this.butThoat.Location = new System.Drawing.Point(216, 164);
            this.butThoat.Name = "butThoat";
            this.butThoat.Size = new System.Drawing.Size(111, 45);
            this.butThoat.TabIndex = 3;
            this.butThoat.Text = "Thoat";
            this.butThoat.UseVisualStyleBackColor = true;
            this.butThoat.Click += new System.EventHandler(this.butThoat_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(385, 264);
            this.Controls.Add(this.butThoat);
            this.Controls.Add(this.butOK);
            this.Controls.Add(this.radServer);
            this.Controls.Add(this.radClient);
            this.Name = "Form1";
            this.Text = "Chon che do chay Client/Server";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.RadioButton radClient;
        private System.Windows.Forms.RadioButton radServer;
        private System.Windows.Forms.Button butOK;
        private System.Windows.Forms.Button butThoat;
    }
}

