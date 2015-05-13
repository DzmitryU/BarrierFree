//List of organizations
var organization_list = {};

function toggleSelectedOrganizationOnMap(organization) {
    var tmp = $("#htree").jstree().get_node("o" + organization.id)
    if (organization != null && organization.displayed) {
        $("#htree").jstree().uncheck_node(tmp);
        //hideOrganizationFromList(organization);
    } else {

        $("#htree").jstree().check_node(tmp);
        //showOrganizationFromList(organization);
    }
    showMarkers();
}

function showOrganizationFromList(organization) {
    if (organization != null) {
        addOrganization(organization.id, organization.name, organization.lat, organization.lng);
        organization.displayed = true;
        $("#show-button-" + organization.id).html('Скрыть');
    }
}

function hideOrganizationFromList(organization) {
    if (organization != null) {
        hideOrganization(organization.id);
        organization.displayed = false;
        $("#show-button-" + organization.id).html('Показать');
    }
}


function hideOrganizationInList(organization) {
    if (organization != null) {
        $("#organization-item-" + organization.id).hide();
        hideOrganizationFromList(organization);
    }
}

function showOrganizationInList(organization) {
    if (organization != null) {
        $("#organization-item-" + organization.id).show();
    }
}

function clearOrganizationList() {
    for (var index in organization_list) {
        hideOrganizationInList(organization_list[index]);
    }
}

function refreshOrganizationList() {
    for (var index in organization_list) {
        hideOrganization(organization_list[index].id);
        organization_list[index].displayed = false;
        $("#show-button-" + organization_list[index].id).html('Показать');
    }
}

function getOrganization(id) {
    var result = null;
    for (var index in organization_list) {
        if (organization_list[index].id == id) {
            result = organization_list[index];
        }
    }
    return result;
}

function markOrganizationDisplayed(organization) {
    if (organization != null) {
        organization.displayed = true;
        $("#show-button-" + organization.id).html('Скрыть');
    }
}

function markOrganizationHidden(organization) {
    if (organization != null) {
        organization.displayed = false;
        $("#show-button-" + organization.id).html('Показать');
    }
}
