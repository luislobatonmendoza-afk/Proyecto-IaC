package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	"github.com/stretchr/testify/assert"
)

func TestNetworkModule(t *testing.T) {
	t.Parallel()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../",
	})

	defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	publicSubnetIds := terraform.OutputList(t, terraformOptions, "public_subnets")

	assert.Equal(t, 1, len(publicSubnetIds), "Debe haber exactamente 1 subred pública, según el diseño.")

	t.Log("Prueba de Módulo Network ejecutada con éxito.")
}
