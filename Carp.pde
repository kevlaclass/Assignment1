class Carp
{
    float children;
    float men;
    float women;
    Float sum;
    float sum2;
    String months;
  
    
    
    Carp(String line )
    
    {
      
      String[] parts = line.split(",");
      months = parts[0];
      men = parseFloat(parts[2]);
      women = parseFloat(parts[1]);
      children = parseFloat(parts[3]);
      for (int i= 1; i< parts.length ; i++)
      {
        sum = parseFloat(parts[i]);
        sum2 += sum;
      }
    
    
    println(line + "," + "," + sum2);
    
    }
}
