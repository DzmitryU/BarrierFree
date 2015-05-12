//List of organizations
var organization_list = {};

function toggleSelectedOrganizationOnMap(organization) {
    if (organization.displayed) {
        hideOrganizationFromList(organization);
    } else {
        showOrganizationFromList(organization);
    }
    showMarkers();
}

function showOrganizationFromList(organization) {
    addOrganization(organization.id, organization.name, organization.lat, organization.lng);
    organization.displayed = true;
    $("#show-button-" + organization.id).html('Скрыть');
}

function hideOrganizationFromList(organization) {
    hideOrganization(organization.id);
    organization.displayed = false;
    $("#show-button-" + organization.id).html('Показать');
}


function hideOrganizationInList(organization) {
    $("#organization-item-" + organization.id).hide();
    hideOrganizationFromList(organization);
}

function showOrganizationInList(organization) {
    $("#organization-item-" + organization.id).show();
}

function clearOrganizationList() {
    for (var index in organization_list) {
        hideOrganizationInList(organization_list[index]);
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
