
import java.util.function.Supplier;

class Foo {
    public void A() {
        sing("Hip Hip Horray! For " + name);
        singLoud("Hello " + name + ", it's nice to meet you.");
        sing("Say yeah! Say yo! Say " + name);
        singSoft("Hello " + name + ", it's nice to meet you.");

        {
            sing("Hip Hip Horray! For " + name);
            singLoud("Hello " + name + ", it's nice to meet you.");
        }
        {
            sing("Say yeah! Say yo! Say " + name);
            singSoft("Hello " + name + ", it's nice to meet you.");
        }

        singLoud("Hello");

        ((Runnable)( () -> singLoud("Hello"))).run();

        Runnable blue = () -> doNothing();
        blue.run();
                
    }
}