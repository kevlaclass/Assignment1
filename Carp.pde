class Carp
{
    float x;
    float y;
    int objectID;
    String name;
    String streetV;
    
    
    Carp(String line )
    
    {
      
      String[] parts = line.split("\t");
      x = parseFloat(parts[0]);
      y = parseFloat(parts[1]);
      objectID = parseInt(parts[2]);
      name = parts[3];
      streetV = parts[4];
    
    println(line);
    
    }
}


  
  
  
  
  
  
  
  
  