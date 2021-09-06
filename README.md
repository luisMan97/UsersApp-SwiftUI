# UsersApp-SwiftUI

## Installation
Run git clone to download proyect

```ruby
git clone https://github.com/luisMan97/UsersApp-SwiftUI.git
```

#### Third Party Libraries
The project does not use third party libraries. Don't cocoapods, don't cartage, don't worry :)

#### Funcionalidades
- La pantalla principal consta de un listado de películas traidas de la API JSONPlaceholder.
- La pantalla principal cuenta con una barra de búsqueda.
- Hay una modal de loading que se muestra cada vez que se hace la petición al servicio web.
- La aplicación persiste el listado de usuarios, cuando se vuelva a entrar y si no se tiene internet, se trae estos datos.

#### Funcionalidades técnicas:
- La aplicación está desarrollada en Swift 5, con SwiftUI y Combine.
- La aplicación tiene cómo arquitectura un tipo de MVVM extendido (CLEAN Architecture).
- La aplicación usa programación reactiva.
- La aplicación implementa diferentes patrones de diseño (Repository, DAO, Coordinator, Builder entre otros).
- La aplicación usa CoreData como gestor de datos locales.
- La aplicación no usa librerías de terceros.
- La aplicación usa una capa genérica y extensible con URLSession para hacer los llamados a los servicios.  
- La aplicación usa Codable para el mapeo de JSON a objetos. 
- La aplicación contiene un .gitignore para no subir archivos innecesarios.

#### Arquitectura
Se implementó CLEAN como arquitectura, con las siguientes capas:
1) View: Contiene las View de SwiftUI
2) Presentation: Contiene los ViewModels
3) Interactor/UseCases: Contiene los casos de uso (acciones de la aplicación y lógica de negocios)
4) Entity/Domain: Contiene las entidades
5) Data: Contiene el patron repository para obtener los datos ya sea de una API o una base de datos local
6) Framework: Contiene la implementación a más detalle de la obtención de datos usando ya la respectiva librería o framework (Alamofire, URLSession, CoreData y etc)
