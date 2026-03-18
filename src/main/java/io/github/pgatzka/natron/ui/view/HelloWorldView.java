package io.github.pgatzka.natron.ui.view;

import com.vaadin.flow.component.html.H1;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;
import com.vaadin.flow.server.auth.AnonymousAllowed;

@Route("/")
@AnonymousAllowed
public class HelloWorldView extends VerticalLayout {

    public HelloWorldView() {
        setSizeFull();

        H1 title = new H1("Hello World");
        add(title);

        setJustifyContentMode(JustifyContentMode.CENTER);
        setAlignItems(Alignment.CENTER);
    }

}
