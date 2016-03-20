#!/usr/bin/env python3

import requests
import json
import pprint
import os
from git import Repo

# List PRs
# For each PR not tested in the past:
#    res = TestPR
#    sent_comment(res)
#    mark_PR_tested


pp = pprint.PrettyPrinter(depth=6)
repo_url = "https://api.github.com/repos/juju-solutions/layer-hue"
#repo_url = "https://api.github.com/repos/juju-solutions/layer-apache-spark"
print("Repo: {}".format(repo_url))
repo_req = requests.get('{}/pulls?state=open'.format(repo_url))
PRs = json.loads(repo_req.text or repo_req.content)
for PR in PRs:
    # CLEAN ENV HERE!
    PR_url = PR['_links']['self']['href']    
    pr_req = requests.get(PR_url)
    pr_details = json.loads(pr_req.text or pr_req.content)
    print("PR: {} is mergeable: {}".format(pr_details['title'], pr_details['mergeable']))
    pp.pprint(pr_details)
    clone_url = pr_details['head']['repo']['clone_url']
    Repo.clone_from(clone_url, os.environ['LAYER_PATH'])

