function toggleSelectedOrganizationOnMap(organization) {
    if (organization.displayed) {
        hideOrganization(organization.id);
        organization.displayed = false;
        $("#show-button-" + organization.id).html('Показать');
    } else {
        addOrganization(organization.id, organization.name, organization.lat, organization.lng);
        organization.displayed = true;
        $("#show-button-" + organization.id).html('Скрыть');
    }
    showMarkers();
}