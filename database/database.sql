CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    cpf VARCHAR(14) UNIQUE NOT NULL
);

CREATE TABLE pacotes (
    id_pacote INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10,2) NOT NULL,
    duracao_dias INT NOT NULL
);

CREATE TABLE destinos (
    id_destino INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    pais VARCHAR(50) NOT NULL,
    descricao TEXT,
    id_pacote INT NOT NULL,
    FOREIGN KEY (id_pacote) REFERENCES pacotes(id_pacote) ON DELETE CASCADE
);

CREATE TABLE reservas (
    id_reserva INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_pacote INT NOT NULL,
    data_reserva DATE NOT NULL,
    data_viagem DATE NOT NULL,
    status ENUM('Confirmado', 'Pendente', 'Cancelado') NOT NULL DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente) ON DELETE CASCADE,
    FOREIGN KEY (id_pacote) REFERENCES pacotes(id_pacote) ON DELETE CASCADE
);
