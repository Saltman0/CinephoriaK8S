k8s_yaml(kustomize('.'))

if not os.path.exists("./Gateway/Development") :
    fail("Gateway directory does not exists !")
include('./Gateway/Development/Tiltfile')

if not os.path.exists("./MessageBroker") :
    fail("MessageBroker directory does not exists !")
include('./MessageBroker/Tiltfile')

if not os.path.exists("./BookingService") :
    fail("BookingService directory does not exists !")
include('./BookingService/Tiltfile')

if not os.path.exists("./GraphQL") :
    fail("GraphQL directory does not exists !")
include('./GraphQL/Tiltfile')

if not os.path.exists("./InfrastructureService") :
    fail("InfrastructureService directory does not exists !")
include('./InfrastructureService/Tiltfile')

if not os.path.exists("./MovieService") :
    fail("MovieService directory does not exists !")
include('./MovieService/Tiltfile')

if not os.path.exists("./ShowtimeService") :
    fail("ShowtimeService directory does not exists !")
include('./ShowtimeService/Tiltfile')

if not os.path.exists("./UserService") :
    fail("UserService directory does not exists !")
include('./UserService/Tiltfile')