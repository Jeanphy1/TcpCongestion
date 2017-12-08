package tcpcongestion.simulations;

import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.node.ethernet.Eth100M;
import inet.node.ethernet.Eth10M;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.visualizer.integrated.IntegratedCanvasVisualizer;
import inet.visualizer.linklayer.DataLinkVisualizer;
import inet.visualizer.linklayer.InterfaceTableCanvasVisualizer;


@license(LGPL);
//
// TODO documentation
//
network Network
{
    @display("bgb=722,328");
    submodules:
        configurator: IPv4NetworkConfigurator {
            parameters:
                @display("p=426,27");
        }
        client1: StandardHost {
            @display("p=29,79");
        }
        client2: StandardHost {
            @display("p=29,208");
        }
        router: Router {
            @display("p=179,145");
        }
        router1: Router {
            @display("p=401,145");
        }
        server1: StandardHost {
            @display("p=545,79");
        }
        server2: StandardHost {
            @display("p=545,208");
        }
        iPv4NetworkConfigurator: IPv4NetworkConfigurator {
            @display("p=286,18");
        }
        visualizer: IntegratedCanvasVisualizer {
            @display("p=155,0");
        }
    connections:
        router.ethg++ <--> Eth100M <--> router1.ethg++;
        client1.ethg++ <--> Eth100M <--> router.ethg++;
        router1.ethg++ <--> Eth100M <--> server1.ethg++;
        router1.ethg++ <--> Eth100M <--> server2.ethg++;
        client2.ethg++ <--> Eth100M <--> router.ethg++;
}

