$(document).ready(function () {

  let appointments;
  $.getJSON("/api/patients/11/appointments")
    .done(function (data) {
      $(function () { $('[data-toggle="popover"]').popover() });
      appointments = data;

      console.log(appointments);
      appointments.forEach((x, i) => {
        $(`#list-app${i + 1}-list`).append(`Date/Time: ${parseDate(x.start)}`);
        $(`#list-app${i + 1}`).html(`<p data-toggle="popover" data-placement="bottom" data-content="${x.doctor.specialty}" data-trigger="hover"><b>Doctor</b>: ${x.doctor.name}</p><p><b>Symptoms</b>: ${x.symptoms}</p>`);
      });
    });
})

function parseDate(x) {
  MM = { Jan: "January", Feb: "February", Mar: "March", Apr: "April", May: "May", Jun: "June", Jul: "July", Aug: "August", Sep: "September", Oct: "October", Nov: "November", Dec: "December" }

  xx = String(new Date(x)).replace(
    /\w{3} (\w{3}) (\d{2}) (\d{4}) (\d{2}):(\d{2}):[^(]+\(([A-Z]{3})\)/,
    function ($0, $1, $2, $3, $4, $5, $6) {
      return $1 + " " + $2 + ", " + $3 + " - " + $4 % 12 + ":" + $5 + (+$4 > 12 ? "PM" : "AM") + " " + $6
    }
  )
  return xx;
}