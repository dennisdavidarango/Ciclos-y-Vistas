//
//  ContentView.swift
//  EspecializacionSwiftUI
//
//  Created by Juan Villalvazo on 26/05/21.
//

import SwiftUI



struct ContentView: View {
    
    
    var body: some View {
        
        NavigationView{
         
            ZStack{
            
            Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 100).ignoresSafeArea()
            
            VStack{
                
                Spacer()
                
               Image("AppLogo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.bottom, 60.0)
               // .offset(x: 0, y: 25.0)
         
                
                InicioYRegistroView()
                
            }
            
            }.navigationBarHidden(true)
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    
    
    
    
    
    }
}


struct InicioYRegistroView:View {
    
    @State var tipoInicioSesion:Bool = true
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                Spacer()
                
                Button("INICIAR SESIÓN"){
                    
                    print("Pantalla Inicio sesion")
                    tipoInicioSesion = true
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE"){
                    
                    print("Pantalla Registro")
                    tipoInicioSesion = false
                }.foregroundColor(tipoInicioSesion ? .gray : .white)
                
                Spacer()
            }
            
            
            Spacer(minLength: 42)
            
            
            if(tipoInicioSesion){
                InicioSesiónView()
            }else{
                RegistroView()
            }
            
        }
        
    }
}

struct InicioSesiónView: View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var isPantallaHomeActive:Bool = false
    
    var body: some View {
        
     
        
        ScrollView{
            
            VStack(alignment: .leading){
                
                Text("Correo electrónico")
                    .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                
                ZStack(alignment: .leading){
                    if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if contraseña.isEmpty { Text("Introduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $contraseña).foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 300,  alignment: .trailing)
                    .foregroundColor(Color("Dark-Cyan"))
                    .padding(.bottom)
                
                Button(action: iniciarSesion) {
                    Text("Iniciar Sesión")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6)
                                    .stroke(Color("Dark-Cyan"), lineWidth: 3).shadow(color: .white, radius: 6))
                }.padding(.bottom)
                
                
                

                
                
                Text("Iniciar sesión con redes sociales").frame( maxWidth: .infinity,  alignment: .center).foregroundColor(.white)
                
                
                HStack {
                        
    
                        Button(action: {print("Inicio de sesión con Facebook")}) {
                            Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                        }
                        
                        .padding()
                    
                    
                    
                    Button(action: {print("Inicio de sesión con Twitter")}) {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }.padding()
                    
                }
                
            }.padding(.horizontal, 42.0)
        
        
            //Destinos de navegación
            NavigationLink(
                destination: HomeView(),
                isActive: $isPantallaHomeActive,
                label: { EmptyView()
                })
        
        }
        

        
    }
    
    
    func iniciarSesion() {
        
       let objetoDatosUsuario = SaveData()
        
         print("Mi correo es \(correo) y mi contraseña es \(contraseña)")
        
        if objetoDatosUsuario.validar(correo: correo, contrasena: contraseña){
            isPantallaHomeActive.toggle()
        }else{
            //isPantallaHomeActive.toggle()
            print("Tus datos son incorrectos")
            
        }
        
        
            
    }
    
    
}

struct RegistroView: View {
    
    @State var correo:String = ""
    @State var contraseña:String = ""
    @State var confirmacionContraseña:String = ""
    
    
    var body: some View {
        
        
        ScrollView{
            
            
            VStack(alignment: .center){
               
                Text("Elije una foto de perfíl")
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    
                
                Text("Puedes cambiar o elejirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)
                    .padding(.bottom)
               
                
                
                Button(action: tomarFoto, label: {
                    ZStack{
                        
                        Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80.0, height: 80.0)
                        
                        Image(systemName: "camera").foregroundColor(.white)
       
                        
                    }
                })
                
                
               
                 
                    
                
            }.padding(.bottom, 18)
            
          
            
            VStack(alignment: .leading){
                
                
                VStack{
                
             
               
                    
                Text("Correo electrónico")
                    .foregroundColor(Color(red: 63/255, green: 202/255, blue: 160/255, opacity: 1.0))
                
                ZStack(alignment: .leading){
                    if correo.isEmpty { Text("ejemplo@gmail.com").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    TextField("", text: $correo).foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan")).padding(.bottom)
                
                
                Text("Contraseña").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if contraseña.isEmpty { Text("Introduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $contraseña).foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                
                Text("Confirmar contraseña*").foregroundColor(.white)
                
                
                ZStack(alignment: .leading){
                    if confirmacionContraseña.isEmpty { Text("Reintroduce tu contraseña").font(.caption).foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1.0)) }
                    
                    SecureField("", text: $confirmacionContraseña).foregroundColor(.white)
                    
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cyan"))
                    .padding(.bottom)
                 
                    
                }
               
                
                Button(action: registrarse) {
                   
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame( maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cyan"), lineWidth: 3).shadow(color: Color("Dark-Cyan"), radius: 6))
   
                       
                }.padding(.bottom)
                
              
                        
                Text("Regístrate con redes sociales").frame( maxWidth: .infinity,  alignment: .center).foregroundColor(.white)
                
                
                HStack {
                        
    
                        Button(action: {print("Inicio de sesión con Facebook")}) {
                            Text("Facebook")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.vertical, 3.0)
                                .frame( maxWidth: .infinity, alignment: .center)
                                .background(Color("Blue-Gray"))
                                .clipShape(RoundedRectangle(cornerRadius: 4.0))
                                
                        }
                        
                        .padding()
                    
                    
                    
                    Button(action: {print("Inicio de sesión con Twitter")}) {
                        Text("Twitter")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 3.0)
                            .frame( maxWidth: .infinity, alignment: .center)
                            .background(Color("Blue-Gray"))
                            .clipShape(RoundedRectangle(cornerRadius: 4.0))
                    }.padding()
                    
                }
                
            }.padding(.horizontal, 42.0)
            
    
       }
        

    }

    
    func tomarFoto()  {
        print("Tomo foto")
        //logica de tomar fotos.
    }
    
    func registrarse()  {
        
        print("Me registro con el correo \(correo), la contraseña \(contraseña) y confirmación de contraseña \(confirmacionContraseña)")
    
        //validación contraseña
        if contraseña == confirmacionContraseña{
          
            let objetoActualizadorDatos = SaveData()
            
            let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contrasena: contraseña, nombre: "")
            
            print("Se guardaron los datos con exito?: \(resultado)")
            
        }else{
            
            print("Contraseñas diferentes, vuelve a intentarlo")
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
     
        Group {
            ContentView()
            InicioSesiónView().background(Color(red: 18/255, green: 31/255, blue: 61/255, opacity: 100).ignoresSafeArea())
        }
        
    }
}

