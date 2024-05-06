import requests;

#---------------------------#
# Déclaration des variables # 
#---------------------------#
ZENDESK_SUBDOMAIN="charentesalliancedsi"
ZENDESK_EMAIL="lraffalli@ocealia-groupe.fr"
ZENDESK_TOKEN="pIiRRnyFHBca8vYhXiAArzIXlZwByOAbkh5ymM3Z"

ZENDESK_URL=f"https://{ZENDESK_SUBDOMAIN}.zendesk.com/api/v2"
ZENDESK_GROUPS=f"{ZENDESK_URL}/groups"
ZENDESK_ORGANIZATIONS=f"{ZENDESK_URL}/organizations"    

# Tickets de l'organisation OCEALIA
ZENDESK_ORG_TICKETS=f"{ZENDESK_ORGANIZATIONS}/22640533/tickets"    


response = requests.get(ZENDESK_ORG_TICKETS, auth=(ZENDESK_EMAIL+'/token', ZENDESK_TOKEN))
if response.ok:
    data = response.json()
    print(data['count'])
#    group_list = data['groups']
#    for group in group_list:    
#        print(group['name'])
#        print(group)
else:
    print(response.text)
