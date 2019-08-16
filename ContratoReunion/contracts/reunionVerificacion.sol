pragma solidity ^0.5.0;

// Declaracion del contrato

contract reunionVerificacion {
    
    // Para la foto
    struct Foto {
        uint id;
        string direccion;
        string hash;
    }
    // Para la reunion
    struct Reunion{
        uint id;
        string tema;
        string fecha;
        bool creado;
        Foto [] dato;
    }
// Iniciando el mapping
    mapping (uint => Reunion) reunion;
// Para el registro de la Reunion
    function nuevaReunion (uint id, string memory tema, string memory fecha) public {
        reunion[id].creado = true;
        reunion[id].id = id;
        reunion[id].fecha = fecha;
        reunion[id].tema = tema;
    }
// Para consultar la reunion
    function consultarReunion (uint id) public view returns (uint, string memory,string memory){
        return (reunion[id].id, reunion[id].fecha, reunion[id].tema);
    }
    
// Para el registro de la foto 
    function nuevaFoto(uint id, uint idFoto, string memory direccion, string memory hash) public returns (uint, uint , string memory, string memory){
        reunion[id].dato.push(Foto({
            id : idFoto,
            direccion : direccion,
            hash : hash 
        }));
    }
// Para consultar la foto 
    function consultarFoto (uint id, uint pos) public view returns (string memory, string memory){
        return (reunion[id].dato[pos].direccion, reunion[id].dato[pos].hash);
    }
}