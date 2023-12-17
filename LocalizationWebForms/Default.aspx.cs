using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Resources;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LocalizationWebForms.App_LocalResources;

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

            UpdateResult();
        }

        protected void OnClick(object sender, EventArgs e)
        {
            UpdateResult();
        }

        private void InitializeDefaultValues()
        {
            calendar.SelectedDate = DateTime.Now;
            timePicker.Text = DateTime.Now.Hour + ":" + DateTime.Now.Minute.ToString("D2");
        }

        private void UpdateResult()
        {
            UpdateTitleResult();
            UpdateLabelResult();
            UpdateFooterResult();
        }

        private void UpdateLabelResult()
        {
            var timePickerTime = TimeSpan.Parse(timePicker.Text);
            labelResult.Text = calendar.SelectedDate.Date.Add(timePickerTime).ToString();
        }
        
        private void UpdateTitleResult()
        {
            var rm = new ResourceManager("LocalizationWebForms.App_LocalResources.Default.aspx", Assembly.GetExecutingAssembly());
            labelTitleResult.Text = rm.GetString("labelTitleResultResource");
        }
        
        private void UpdateFooterResult()
        {
            labelFooterResult.Text = Default_aspx.labelFooterResultResource;
        }
    }
}