var options =
{
    "core" :
    {
        "data" : [],
        "themes" : {
            "icons" : false,
            "dblclick_toggle" : false
        }
    },
    "checkbox" :
    {
        "whole_node" : false,
        //"three_state" : false,
        "keep_selected_style" : false
    },
    "plugins" : [ "wholerow", "search", "checkbox" ]
}

//HTree
function configureHTree(tree_id, data) {
    options.core.data = data;
    $(tree_id).jstree(options);
    bindCheckbox(tree_id);
}

// HSearch
function addSearching(tree_id, search_field) {
    var to = false;
    $(search_field).keyup(function () {
        if(to) { clearTimeout(to); }
        to = setTimeout(function () {
            var v = $(search_field).val();
            $(tree_id).jstree(true).search(v);
        }, 250);
    });
}

function updateMapFromTree(tree_id) {
    clearMap();
    var bottom_checked = $(tree_id).jstree().get_bottom_checked();
    for (var index in bottom_checked) {
        var id = bottom_checked[index];
        var node = $(tree_id).jstree().get_node(id);

        if (node.original.type === "class by.ulezla.entity.Organization") {
            addOrganization(node.original.nodeId, node.text,
                node.original.coordinate.lat, node.original.coordinate.lng);
        }
    }
    showMarkers();
}

//Checkbox
function bindCheckbox(tree_id) {
    $(tree_id).bind(
        "select_node.jstree", function(evt, data){
            updateMapFromTree(tree_id);
        }
    );

    $(tree_id).bind(
        "deselect_node.jstree", function(evt, data){
            updateMapFromTree(tree_id);
        }
    );
}

function clearTree(tree_id) {
    $(tree_id).jstree().deselect_all();
}