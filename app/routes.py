from flask import render_template, request, redirect, url_for, current_app as app
from .models import Cliente  # Certifique-se de importar Cliente
from . import db

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/painel')
def painel():
    clientes = Cliente.query.all()
    return render_template('painel.html', clientes=clientes)

@app.route('/add_cliente', methods=['GET', 'POST'])
def add_cliente():
    if request.method == 'POST':
        nome = request.form['nome']
        email = request.form['email']
        telefone = request.form['telefone']
        cliente = Cliente(nome=nome, email=email, telefone=telefone)
        db.session.add(cliente)
        db.session.commit()
        return redirect(url_for('painel'))
    return render_template('cadastrar.html')