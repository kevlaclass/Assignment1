void setup()
{


size(500,500);
LoadData();

}
ArrayList<Carp> carps = new ArrayList<Carp>();



void LoadData(){
String [] data = loadStrings( "data.txt" );

for (int i = 0; i < data.length; i++)
{
    Carp carp = new Carp(data[i]);
    carps.add(carp);
}

}
void draw(){




}