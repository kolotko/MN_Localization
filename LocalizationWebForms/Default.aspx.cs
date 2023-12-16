using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LocalizationWebForms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                InitializeDefaultValues();
            }

            UpdateLabelResult();
        }

        protected void OnClick(object sender, EventArgs e)
        {
            UpdateLabelResult();
        }

        private void InitializeDefaultValues()
        {
            calendar.SelectedDate = DateTime.Now;
            timePicker.Text = DateTime.Now.Hour + ":" + DateTime.Now.Minute.ToString("D2");
        }

        private void UpdateLabelResult()
        {
            var timePickerTime = TimeSpan.Parse(timePicker.Text);
            labelResult.Text = calendar.SelectedDate.Date.Add(timePickerTime).ToString();
        }
    }
}