library webapp_base_ui_angular.mm_uia_pindicator;

import 'dart:html' as html;
import "dart:svg";

import "package:angular/angular.dart";
import 'package:angular/core/annotation_src.dart';

import 'package:logging/logging.dart';

//---------------------------------------------------------
// Eigene Packages

//import 'package:http_utils/http_utils.dart';
import 'package:validate/validate.dart';

//import 'package:webapp_base_dart/communication.dart';
//import 'package:webapp_base_dart/events.dart';
//import 'package:webapp_base_ui/uievents.dart';


/**
 * ProgressIndicator Module.
 *    Weitere Infos: https://docs.angulardart.org/#di.Module
 */
class ProgressIndicatorModule extends Module {
    ProgressIndicatorModule() {
        bind(ProgressIndicatorComponent);
    }
}

// @formatter:off    
/// ProgressIndicatorComponent-Componente
@Component(
    selector: 'pindicator', 
    useShadowDom: true,
    //applyAuthorStyles: true, 
    templateUrl: 'mm_uia_pindicator.html' /* ,
    cssUrl: 'packages/webapp_base_ui_angular/mm_uia_pindicator/mm_uia_pindicator.css' */ ) 
// @formatter:on    
class ProgressIndicatorComponent  implements ShadowRootAware {
    final _logger = new Logger('webapp_base_ui_angular.mm_uia_pindicator');

    String _size = "50";
    String _color = "slategray";

    final html.Element _component;

    ProgressIndicatorComponent(this._component) {
        Validate.notNull(_component);
    }

    @NgAttr("size")
    String get size => _size;
    set size(String value) {
        if(value != null && !value.isEmpty) {
            _size = value;
        }
    }

    @NgAttr("color")
    String get color => _color;
    set color(String value) {
        if(value != null && !value.isEmpty) {
            _color = value;
        }
    }

    /// Das abfragen der size mit {{cmp.size}} produziert immer eine Fehlermeldung in den DevTools
    void onShadowRoot(html.ShadowRoot shadowRoot) {
        final SvgElement svg = shadowRoot.querySelector(".pindicator");
        _logger.info("onShadowRoot SVG: $svg");
        if(svg != null) {
            svg.setAttribute("width",size);
            svg.setAttribute("height",size);

            svg.setAttribute("style","stroke: $color");

            _logger.info("Color: ${_component.style.color}, Size: $size");
        }
    }

    // --------------------------------------------------------------------------------------------
    // EventHandler

    /// Sample: ng-click="cmp.handleEvent($event)"
    void handleEvent(final html.Event e) {
        _logger.fine("Event: handleEvent");
    }



// -- private ---------------------------------------------------------------------------------
}
        