<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Mashinani tahrirlash</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap');

        body {
            font-family: 'Inter', sans-serif;
            background: linear-gradient(135deg, #e0e7ff 0%, #f3e8ff 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0;
            overflow-x: hidden;
        }

        .edit-form-container {
            max-width: 600px;
            width: 100%;
            margin: 2rem;
            padding: 2rem;
            background: rgba(255, 255, 255, 0.95);
            border-radius: 1rem;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            backdrop-filter: blur(10px);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .edit-form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }

        .form-header h2 {
            color: #1e3a8a;
            font-weight: 700;
            background: linear-gradient(to right, #1e3a8a, #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }

        .form-header p {
            color: #6b7280;
            font-size: 0.95rem;
        }

        .form-label {
            font-weight: 600;
            color: #1f2937;
            margin-bottom: 0.5rem;
            transition: color 0.2s ease;
        }

        .input-group {
            position: relative;
        }

        .form-control {
            border: 2px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 0.75rem 1rem;
            transition: all 0.3s ease;
            background: #f9fafb;
        }

        .form-control:focus {
            border-color: #3b82f6;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
            background: #ffffff;
        }

        .input-group-text {
            background: linear-gradient(to right, #3b82f6, #60a5fa);
            color: white;
            border: none;
            border-radius: 0.75rem 0 0 0.75rem;
            padding: 0.75rem;
            transition: transform 0.2s ease;
        }

        .input-group-text:hover {
            transform: scale(1.05);
        }

        .btn-save {
            background: linear-gradient(to right, #2563eb, #3b82f6);
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-save:hover {
            background: linear-gradient(to right, #1d4ed8, #2563eb);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
        }

        .btn-secondary {
            background: #6b7280;
            border: none;
            border-radius: 0.75rem;
            padding: 0.75rem 1.5rem;
            font-weight: 600;
            color: white;
            transition: all 0.3s ease;
        }

        .btn-secondary:hover {
            background: #4b5563;
            transform: translateY(-2px);
        }

        .form-control::placeholder {
            color: #9ca3af;
            font-style: italic;
        }

        .fade-in {
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        @media (max-width: 576px) {
            .edit-form-container {
                margin: 1rem;
                padding: 1.5rem;
            }

            .form-header h2 {
                font-size: 1.5rem;
            }

            .btn-save, .btn-secondary {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }
    </style>
</head>
<body>
<div class="container">
    <div class="edit-form-container fade-in">
        <div class="form-header text-center mb-4">
            <h2><i class="bi bi-car-front-fill me-2"></i>Mashinani tahrirlash</h2>
            <p>Mashina ma'lumotlarini zamonaviy va qulay tarzda o'zgartiring</p>
        </div>

        <form action="editCar" method="post" class="needs-validation" novalidate>
            <input type="hidden" name="id" value="${car.id}">

            <div class="mb-4">
                <label for="brand" class="form-label">Brend</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-tag"></i></span>
                    <input type="text" class="form-control" id="brand" name="brand"
                           value="${car.brand}" placeholder="Mashina brendi" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="model" class="form-label">Model</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-card-text"></i></span>
                    <input type="text" class="form-control" id="model" name="model"
                           value="${car.model}" placeholder="Mashina modeli" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="color" class="form-label">Rangi</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-palette"></i></span>
                    <input type="text" class="form-control" id="color" name="color"
                           value="${car.color}" placeholder="Mashina rangi" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="year" class="form-label">Ishlab chiqarilgan yili</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-calendar"></i></span>
                    <input type="number" class="form-control" id="year" name="year"
                           value="${car.year}" placeholder="2020" min="1900" max="2099" required>
                </div>
            </div>

            <div class="mb-4">
                <label for="price" class="form-label">Narxi ($)</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="bi bi-currency-dollar"></i></span>
                    <input type="number" step="0.01" class="form-control" id="price" name="price"
                           value="${car.price}" placeholder="45000.00" required>
                </div>
            </div>

            <div class="d-flex justify-content-end gap-2">
                <a href="cars" class="btn btn-secondary">
                    <i class="bi bi-arrow-left me-1"></i> Ortga
                </a>
                <button type="submit" class="btn btn-save">
                    <i class="bi bi-save me-1"></i> Saqlash
                </button>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    (function () {
        'use strict'
        const forms = document.querySelectorAll('.needs-validation')
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }
                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>
</body>
</html>