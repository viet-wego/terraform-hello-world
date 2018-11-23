import jenkins.model.*
import hudson.security.*
import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.Jenkins

def instance = Jenkins.getInstance()

def hudsonRealm = new HudsonPrivateSecurityRealm(false)
hudsonRealm.createAccount("admin","Iamnoone")
instance.setSecurityRealm(hudsonRealm)
 
instance.setCrumbIssuer(new DefaultCrumbIssuer(true))

instance.save()