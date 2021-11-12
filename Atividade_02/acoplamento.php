// Exemplo de acomplamento

// --------------------------- Antes -----------------------------

// Nesse exemplo de pode-se observar um acoplamento de alto nivel devido a classe
// 'PasswordReminder' ter de criar uma istância da classe 'MySQLConnection' tornando assim
// a esse classe dependente da 'MySQLConnection'.

<?php

use MySQLConnection;

class PasswordReminder
{
    private $dbConnection;
    
    public function __construct()
    {       
        $this->dbConnection = new MySQLConnection();           
    }
    
}

//--------------------- Depois -----------------------------

// Visto a alta depedencia da classe 'PasswordReminder' da implementação 'MySQLConnection',
// é preciso reduzir o acoplamento entre elas. Assim cria-se uma interface 'DBConnectionInterface',
// de modo que a classe 'PasswordReminder' não dependa da classe 'MySQLConnection', abrindo assim
// possibilidades de alterações sem a preocupação de conflitos com a classe 'MySQLConnection'.

<?php

interface DBConnectionInterface
{
    public function connect();
}


class MySQLConnection implements DBConnectionInterface
{
    public function connect()
    {
        // ...
    }
}

class OracleConnection implements DBConnectionInterface
{
    public function connect()
    {
        // ...
    }
}

class PasswordReminder
{
    private $dbConnection;

    public function __construct(DBConnectionInterface $dbConnection) {
        $this->dbConnection = $dbConnection;
    }
  
}
