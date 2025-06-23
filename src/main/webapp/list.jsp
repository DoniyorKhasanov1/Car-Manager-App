<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="uz">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Mashinalar boshqaruvi</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap');

    :root {
      --primary-gradient: linear-gradient(90deg, #4f46e5, #7c3aed);
      --card-bg: rgba(255, 255, 255, 0.95);
      --text-primary: #1e293b;
      --text-secondary: #64748b;
    }

    body {
      font-family: 'Poppins', sans-serif;
      background: linear-gradient(135deg, #c7d2fe, #e9d5ff);
      min-height: 100vh;
      margin: 0;
      padding: 2rem;
      overflow-x: hidden;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
    }

    .page-header {
      text-align: center;
      margin-bottom: 3rem;
    }

    .page-title {
      font-size: 2.8rem;
      font-weight: 700;
      background: var(--primary-gradient);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }

    .page-subtitle {
      color: var(--text-secondary);
      font-size: 1.1rem;
      margin-top: 0.5rem;
    }

    .card {
      background: var(--card-bg);
      border-radius: 1.5rem;
      box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
      backdrop-filter: blur(10px);
      padding: 2rem;
      margin-bottom: 2rem;
      transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
    }

    .stat-card {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1.5rem;
      border-left: 0.4rem solid #4f46e5;
    }

    .stat-card .stat-value {
      font-size: 2rem;
      font-weight: 700;
      color: var(--text-primary);
    }

    .stat-card .stat-label {
      color: var(--text-secondary);
      font-size: 0.9rem;
      text-transform: uppercase;
    }

    .form-group {
      margin-bottom: 1.5rem;
    }

    .form-label {
      font-weight: 600;
      color: var(--text-primary);
      margin-bottom: 0.5rem;
    }

    .form-input {
      border: 2px solid #e5e7eb;
      border-radius: 0.75rem;
      padding: 0.75rem 1rem;
      width: 100%;
      background: #f9fafb;
      transition: all 0.3s ease;
    }

    .form-input:focus {
      border-color: #4f46e5;
      box-shadow: 0 0 0 4px rgba(79, 70, 229, 0.1);
      background: #ffffff;
      outline: none;
    }

    .btn {
      border-radius: 0.75rem;
      padding: 0.75rem 1.5rem;
      font-weight: 600;
      transition: all 0.3s ease;
      display: inline-flex;
      align-items: center;
    }

    .btn-primary {
      background: var(--primary-gradient);
      color: white;
      border: none;
    }

    .btn-primary:hover {
      background: linear-gradient(90deg, #4338ca, #6d28d9);
      transform: translateY(-2px);
      box-shadow: 0 4px 12px rgba(79, 70, 229, 0.3);
    }

    .btn-warning {
      background: #f59e0b;
      color: white;
      border: none;
    }

    .btn-warning:hover {
      background: #d97706;
      transform: translateY(-2px);
    }

    .btn-danger {
      background: #ef4444;
      color: white;
      border: none;
    }

    .btn-danger:hover {
      background: #dc2626;
      transform: translateY(-2px);
    }

    .table-container {
      overflow-x: auto;
    }

    .table {
      width: 100%;
      border-collapse: separate;
      border-spacing: 0;
      background: white;
      border-radius: 1rem;
      overflow: hidden;
    }

    .table th {
      background: #f3f4f6;
      color: var(--text-primary);
      font-weight: 600;
      padding: 1rem;
      text-align: left;
    }

    .table td {
      padding: 1rem;
      color: var(--text-primary);
      border-top: 1px solid #e5e7eb;
    }

    .table tr {
      transition: background 0.2s ease;
    }

    .table tr:hover {
      background: #f0f9ff;
    }

    .color-badge {
      padding: 0.5rem 1rem;
      border-radius: 0.5rem;
      font-weight: 500;
      display: inline-block;
      transition: transform 0.2s ease;
    }

    .color-badge:hover {
      transform: scale(1.05);
    }

    .fade-in {
      animation: fadeIn 0.8s ease-in-out;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    @media (max-width: 768px) {
      body {
        padding: 1rem;
      }

      .page-title {
        font-size: 2rem;
      }

      .card {
        padding: 1.5rem;
      }

      .form-group {
        margin-bottom: 1rem;
      }

      .btn {
        width: 100%;
        margin-bottom: 0.5rem;
      }

      .table th, .table td {
        font-size: 0.9rem;
        padding: 0.75rem;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <div class="page-header fade-in">
    <h1 class="page-title"><i class="bi bi-car-front-fill me-2"></i>Mashinalar boshqaruvi</h1>
    <p class="page-subtitle">Mashinalarni qulay va zamonaviy boshqaring</p>
  </div>

  <!-- Statistik karta -->
  <div class="stat-card card fade-in">
    <div>
      <div class="stat-label">Jami mashinalar</div>
      <div class="stat-value">${carList.size()}</div>
    </div>
    <i class="bi bi-car-front text-indigo-600 text-3xl"></i>
  </div>

  <!-- Yangi mashina qo'shish -->
  <div class="card fade-in">
    <h3 class="text-lg font-semibold text-gray-900 mb-4"><i class="bi bi-plus-circle me-2"></i>Yangi mashina qo'shish</h3>
    <form action="addCar" method="post" class="grid grid-cols-1 md:grid-cols-5 gap-4">
      <div class="form-group">
        <label for="brand" class="form-label">Brend</label>
        <input type="text" class="form-input" id="brand" name="brand" placeholder="Mercedes" required>
      </div>
      <div class="form-group">
        <label for="model" class="form-label">Model</label>
        <input type="text" class="form-input" id="model" name="model" placeholder="C-Class" required>
      </div>
      <div class="form-group">
        <label for="color" class="form-label">Rangi</label>
        <input type="text" class="form-input" id="color" name="color" placeholder="Qora" required>
      </div>
      <div class="form-group">
        <label for="year" class="form-label">Yili</label>
        <input type="number" class="form-input" id="year" name="year" placeholder="2020" min="1900" max="2099" required>
      </div>
      <div class="form-group">
        <label for="price" class="form-label">Narxi ($)</label>
        <input type="number" step="0.01" class="form-input" id="price" name="price" placeholder="45000.00" required>
      </div>
      <div class="md:col-span-5">
        <button type="submit" class="btn btn-primary"><i class="bi bi-save me-2"></i>Saqlash</button>
      </div>
    </form>
  </div>

  <!-- Mashinalar jadvali -->
  <div class="card fade-in">
    <h3 class="text-lg font-semibold text-gray-900 mb-4"><i class="bi bi-list-ul me-2"></i>Mashinalar ro'yxati</h3>
    <div class="table-container">
      <table class="table">
        <thead>
        <tr>
          <th>#</th>
          <th>Brend</th>
          <th>Model</th>
          <th>Rangi</th>
          <th>Yili</th>
          <th>Narxi ($)</th>
          <th>Amallar</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="car" items="${carList}" varStatus="i">
          <tr>
            <td>${i.index + 1}</td>
            <td>${car.brand}</td>
            <td>${car.model}</td>
            <td>
                                <span class="color-badge" style="background-color: ${car.color.toLowerCase() eq 'qora' ? '#000000' :
                                        car.color.toLowerCase() eq 'oq' ? '#ffffff' :
                                                car.color.toLowerCase() eq 'qizil' ? '#dc3545' :
                                                        car.color.toLowerCase() eq 'ko\'k' ? '#0d6efd' :
                                                                car.color.toLowerCase() eq 'yashil' ? '#198754' : '#6c757d'};
                                        color: ${car.color.toLowerCase() eq 'oq' ? '#000000' : 'white'};
                                        border: ${car.color.toLowerCase() eq 'oq' ? '1px solid #e5e7eb' : 'none'};">
                                    ${car.color}
                                </span>
            </td>
            <td>${car.year}</td>
            <td><strong>$${car.price}</strong></td>
            <td class="flex gap-2">
              <a href="editCar?id=${car.id}" class="btn btn-warning"><i class="bi bi-pencil me-1"></i>Tahrirlash</a>
              <a href="deleteCar?id=${car.id}" class="btn btn-danger" onclick="return confirm('Ushbu mashinani o\'chirmoqchimisiz?')"><i class="bi bi-trash me-1"></i>O'chirish</a>
            </td>
          </tr>
        </c:forEach>
        <c:if test="${empty carList}">
          <tr>
            <td colspan="7" class="text-center text-gray-500 py-5">Hozircha mashinalar ro'yxati bo‘sh</td>
          </tr>
        </c:if>
        </tbody>
      </table>
    </div>
  </div>
</body>

</html>