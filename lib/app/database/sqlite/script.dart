final criarTabelaReceita = '''
CREATE TABLE receita(
  id INTEGER NOT NULL PRIMARY KEY
  ,descricao VARCHAR(200) NOT NULL
  ,valor DECIMAL(9,2) NOT NULL
  ,data DATE NOT NULL
)
''';

final criarTabelaDespesa = '''
CREATE TABLE despesa(
  id INTEGER NOT NULL PRIMARY KEY
  ,descricao VARCHAR(200) NOT NULL
  ,valor DECIMAL(9,2) NOT NULL
  ,data DATE NOT NULL
)
''';


final insert1= '''
INSERT INTO receita (descricao, valor, data)
VALUES ('Salário','1800,00','01/06/2021')
''';

final insert2= '''
INSERT INTO receita (descricao, valor, data)
VALUES ('Mesada','200,00','02/06/2021')
''';

final insert3= '''
INSERT INTO despesa (descricao, valor, data)
VALUES ('Lanche','6,00','20/06/2021')
''';

final insert4= '''
INSERT INTO despesa (descricao, valor, data)
VALUES ('Refrigerante','6,00','20/06/2021')
''';

final insert5= '''
INSERT INTO receita (descricao, valor, data)
VALUES ('teste','5,00','20/06/2021')
''';