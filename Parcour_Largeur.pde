void Parcour_Largeur()
{
  boolean trouver = false;
  LinkedList<Position> file = new LinkedList();
  file.add(Player);
  Position Courant = new Position();
  Position Dernier = null;
  
  for(int a = 0; a<taille_grille[0]; a++)
  {
    for( int b = 0; b<taille_grille[1]; b++)
    {
      voisins_faits[a][b] = 0;
    }
  }
    for(int i = 0; i<taille_grille[0]; i++)
  {
    for( int j = 0; j<taille_grille[1]; j++)
    {
      if (grille[i][j] == 0)
      {
        fill(255,128,0);
        rect(i*taille_pixel[0], j*taille_pixel[1], taille_pixel[0], taille_pixel[1]);
      }
    }
  }
  
  
  while(!trouver && !file.isEmpty())
  {
    Courant = file.remove();
    if( Courant.x == Objectif.x && Courant.y == Objectif.y)
    {
      Dernier = Courant;
      trouver = true;
    }
    
    if (trouver == true) break;
    
    Position[] Voisins = new Position[4];
    Voisins[0] = new Position(Courant.x+1, Courant.y); 
    Voisins[1] = new Position(Courant.x-1, Courant.y);
    Voisins[2] = new Position(Courant.x, Courant.y+1);
    Voisins[3] = new Position(Courant.x, Courant.y-1);
    
    for( int count = 0; count < 4; count++)
    {
      if( Voisins[count].x >= 0 && Voisins[count].x < taille_grille[0] && Voisins[count].y >= 0 && Voisins[count].y < taille_grille[1] && voisins_faits[Voisins[count].x][Voisins[count].y] == 0 && grille[Voisins[count].x][Voisins[count].y] != 0)
      {
        file.add(Voisins[count]);
        Voisins[count].precedent = Courant;
        if (Voisins[count].x == Objectif.x && Voisins[count].y == Objectif.y) break;
        voisins_faits[Voisins[count].x][Voisins[count].y] = 1;
        fill(80,70,80);
        circle(Voisins[count].x*taille_pixel[0]+taille_pixel[0]/2, Voisins[count].y*taille_pixel[1]+taille_pixel[1]/2, 25);
      }
    }
   
  }
  
    Courant = Dernier;
    if( trouver == true)
    {
    while( Courant.precedent != null )
    {
        fill(0,255,0);
        circle(Courant.x*taille_pixel[0]+taille_pixel[0]/2, Courant.y*taille_pixel[1]+taille_pixel[1]/2, 25);
        Courant = Courant.precedent;
    }
    }
}
