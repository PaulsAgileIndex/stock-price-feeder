## {{ $prefix := (env "STAGE") }}

	##########################################################
	##    Template Mechanism:                               ##
	##                                                      ##
	##    !!! IMPORTANT !!!                                 ##
	##                                                      ##
	##    consul-tempalte does not have the same -prefix    ##
	##    functionality like confd which results in the     ##
	##    first two lines of this script.                   ## 
	##                                                      ##
	##    ----------------------------------------------    ##
	##                                                      ##
	##    Spring Application:                               ##
	##                                                      ##
	##    This property file will be set on                 ##
	##    an environment path on the executing computer.    ##
	##                                                      ##
	##    Target is to amend this file with                 ## 
	##    'consul-template' for the different stages        ##
	##    (dev, test, uat, prod).                           ##
	##                                                      ##
	##########################################################


##########################################################
##    Base info for application and                     ##
##    configuration management                          ##
##########################################################
base.info.deployed.application={{key (print $prefix "/base/info/deployed/application")}}
base.info.deployed.stage={{key (print $prefix "/base/info/deployed/stage")}}
server.port=8080