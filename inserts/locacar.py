import mysql.connector

config = {
    'user': 'root',
    'password': '',
    'host': 'localhost',
    'database': 'locacar',
    }

def conectar():
    return mysql.connector.connect(**config)

def inserir_automovel(conexao, auto_marca, auto_nome, auto_categoria):
    try:
        cursor = conexao.cursor()
        insert_query = 'INSERT INTO automovel (auto_marca, auto_nome, auto_categoria) VALUES (%s, %s, %s)'
        cursor.execute(insert_query, (auto_marca, auto_nome, auto_categoria))
        conexao.commit()
        print('Automovel inserido com sucesso!')
    except mysql.connector.Error as e:
        print('Erro ao inserir automovel:', e)

try:
    conexao = conectar()

    while True:
        print('Menu de Opções:')
        print('1. Inserir Automovel')
        print('2. Sair')

        escolha = input('Digite o número da opção desejada: ')

        if escolha == '1':
            marca = input('Digite o marca do automovel: ')
            nome  = input('Digite o nome do automovel: ')
            categoria = input('Digite a categoria do automovel: ')
            inserir_automovel(conexao, marca, nome, categoria)
        elif escolha == '2':
            break
        else:
            print('Opção inválida. Por favor, escolha uma opção válida.')

except mysql.connector.Error as e:
    print('Erro ao conectar ao MySQL:', e)

finally:
    if  conexao.is_connected():
        conexao.close()
        print('Conexão encerrada.')