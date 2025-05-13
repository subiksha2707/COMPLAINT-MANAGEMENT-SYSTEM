// Handle login form submission
const loginForm = document.getElementById("login-form");
if (loginForm) {
  loginForm.addEventListener("submit", function (e) {
    e.preventDefault();

    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();

    if (username !== "" && password !== "") {
      localStorage.setItem("isLoggedIn", "true");
      localStorage.setItem("username", username);
      window.location.href = "complaints-list.html";
    } else {
      document.getElementById("error").style.display = "block";
    }
  });
}

// Handle complaint form submission
const complaintForm = document.getElementById("complaint-form");
if (complaintForm) {
  complaintForm.addEventListener("submit", function (event) {
    event.preventDefault();

    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const description = document.getElementById("description").value;
    const category = document.getElementById("category").value;

    console.log('Complaint submitted:', { name, email, description, category });

    complaintForm.style.display = 'none';
    document.getElementById("success-message").style.display = 'block';
  });
}

// Set category dynamically based on complaint ID in URL
const urlParams = new URLSearchParams(window.location.search);
const complaintId = parseInt(urlParams.get("id"));
const categoryInput = document.getElementById("category");

if (categoryInput && complaintId) {
  const complaints = [
    { id: 1, title: "Noise Complaint" },
    { id: 2, title: "Water Supply Issue" },
    { id: 3, title: "Electricity Problem" },
    { id: 4, title: "Sanitation Issue" },
    { id: 5, title: "Security Concern" },
    { id: 6, title: "Parking Problem" },
    { id: 7, title: "Lift Not Working" },
    { id: 8, title: "Play Area Maintenance" },
    { id: 9, title: "Leakage Issue" },
    { id: 10, title: "Intercom System" },
    { id: 11, title: "Stray Dog Menace in Society Premises" },
    { id: 12, title: "Sewage Overflow" },
    { id: 13, title: "Theft Report" },
    { id: 14, title: "Fire Alarm Malfunctioning" },
    { id: 15, title: "Others" },
  ];

  const selectedComplaint = complaints.find(complaint => complaint.id === complaintId);
  if (selectedComplaint) {
    categoryInput.value = selectedComplaint.title;
  }
}
