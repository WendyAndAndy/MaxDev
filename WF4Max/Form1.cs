using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace WF4Max
{
    public partial class MyWindow : Form
    {
        public MyWindow()
        {
            InitializeComponent();
        }

        void ShowStatus(object sender)
        {
            this.txtStatus.Text = (sender as Button).Text;
        }

        private void btnBox_Click(object sender, EventArgs e)
        {
            ShowStatus(sender);
        }

        private void btnTeapot_Click(object sender, EventArgs e)
        {
            ShowStatus(sender);
        }
    }
}
