$(document).ready(function () {

  $.getJSON("/api/patients/1/appointments")
    .done(function (data) {
      $(function () {
        $('[data-toggle="popover"]').popover({
          html: true,
          placement: 'top',
          trigger: 'hover'
        })
      });

      data.forEach((x, i) => {
        // Patient name
        $(`#patient-name`).text(`${x.patient.name}`);
        // Date parsing for appointment
        $(`#list-app${i + 1}-list`).append(`Date/Time: ${parseDate(x.start)}`);
        // Popover for doctor
        $(`#list-app${i + 1}`).html(`
        <p><b>Doctor</b>: 
        <a href='#' title="${x.doctor.name}" 
        data-toggle="popover" 
        data-content="
        <img src='assets/images/icon-person.png'>
        <p><b>Specialty</b>: ${x.doctor.specialty}</p>
        <p><b>Education</b>: ${x.doctor.education}</p>">
        ${x.doctor.name}</a></p>
        <p><b>Symptoms</b>: ${x.symptoms}</p>
        <p><a href="#">Move appointment</a> - <a href="#">Cancel</a>`);
      });
    });
})

// Date parsing helper
function parseDate(x) {
  return String(new Date(x)).replace(
    /\w{3} (\w{3}) (\d{2}) (\d{4}) (\d{2}):(\d{2}):[^(]+\(([A-Z]{3})\)/,
    function ($0, $1, $2, $3, $4, $5, $6) {
      return $1 + " " + $2 + ", " + $3 + " - " + $4 % 12 + ":" + $5 + (+$4 > 12 ? "PM" : "AM") + " " + $6
    }
  )
}