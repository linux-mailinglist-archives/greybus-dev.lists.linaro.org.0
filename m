Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CDC4BDB14
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Feb 2022 18:06:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03B903EEE8
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Feb 2022 17:06:58 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 69F1C3ECAA
	for <greybus-dev@lists.linaro.org>; Mon, 21 Feb 2022 17:06:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 81B65B81604;
	Mon, 21 Feb 2022 17:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4524C340F1;
	Mon, 21 Feb 2022 17:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645463213;
	bh=/gW2nJhgpy7aHUQASMQy4APDC2IBYUJZ/lqp5fmORtE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7ghdKBKguX2VhhjBq1XzqNFqubSpftc4citLp9zEHxF0rg9y32+glEDXf1CCtJ5f
	 013h3jOlIH7XDBSUoJSrT1DLUaD4kgDiwpTg0iJ5071pp5edcRQO0NXgzFX7P3IVzh
	 kt8g/HzEe7pjlfC0DM+yIXuvaqQ0etaGhx8B0mL8=
Date: Mon, 21 Feb 2022 18:06:50 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <YhPGqg2BydlAFiM1@kroah.com>
References: <1644580947-8529-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1644580947-8529-1-git-send-email-chensong_2000@189.cn>
Message-ID-Hash: CNVWNT3KZFBDZOZ2Q4N4CMIE2VIJ2TUR
X-Message-ID-Hash: CNVWNT3KZFBDZOZ2Q4N4CMIE2VIJ2TUR
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CNVWNT3KZFBDZOZ2Q4N4CMIE2VIJ2TUR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 11, 2022 at 08:02:27PM +0800, Song Chen wrote:
> Introduce apply in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.
> 
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> 
> ---
> V2:
> 1, define duty_cycle and period as u64 in gb_pwm_config_operation.
> 2, define duty and period as u64 in gb_pwm_config_request.
> 3, disable before configuring duty and period if the eventual goal
>    is a disabled state.
> ---
>  drivers/staging/greybus/pwm.c             | 61 ++++++++++++-----------
>  include/linux/greybus/greybus_protocols.h |  4 +-
>  2 files changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 891a6a672378..03c69db5b9be 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -89,7 +89,7 @@ static int gb_pwm_deactivate_operation(struct gb_pwm_chip *pwmc,
>  }
>  
>  static int gb_pwm_config_operation(struct gb_pwm_chip *pwmc,
> -				   u8 which, u32 duty, u32 period)
> +				   u8 which, u64 duty, u64 period)
>  {
>  	struct gb_pwm_config_request request;
>  	struct gbphy_device *gbphy_dev;
> @@ -99,8 +99,8 @@ static int gb_pwm_config_operation(struct gb_pwm_chip *pwmc,
>  		return -EINVAL;
>  
>  	request.which = which;
> -	request.duty = cpu_to_le32(duty);
> -	request.period = cpu_to_le32(period);
> +	request.duty = duty;
> +	request.period = period;
>  
>  	gbphy_dev = to_gbphy_dev(pwmc->chip.dev);
>  	ret = gbphy_runtime_get_sync(gbphy_dev);
> @@ -204,43 +204,46 @@ static void gb_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
>  	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
>  }
>  
> -static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> -			 int duty_ns, int period_ns)
> +static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			const struct pwm_state *state)
>  {
> +	int err;
> +	bool enabled = pwm->state.enabled;
>  	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
>  
> -	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
> -};
> -
> -static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
> -			       enum pwm_polarity polarity)
> -{
> -	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
> -
> -	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
> -};
> +	/* set polarity */
> +	if (state->polarity != pwm->state.polarity) {
> +		if (enabled) {
> +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> +			enabled = false;
> +		}
> +		err = gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarity);
> +		if (err)
> +			return err;
> +	}
>  
> -static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
> +	if (!state->enabled) {
> +		if (enabled)
> +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> +		return 0;
> +	}
>  
> -	return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
> -};
> +	/* set period and duty cycle*/
> +	err = gb_pwm_config_operation(pwmc, pwm->hwpwm, state->duty_cycle, state->period);
> +	if (err)
> +		return err;
>  
> -static void gb_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
> +	/* enable/disable */
> +	if (!enabled)
> +		return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
>  
> -	gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> -};
> +	return 0;
> +}
>  
>  static const struct pwm_ops gb_pwm_ops = {
>  	.request = gb_pwm_request,
>  	.free = gb_pwm_free,
> -	.config = gb_pwm_config,
> -	.set_polarity = gb_pwm_set_polarity,
> -	.enable = gb_pwm_enable,
> -	.disable = gb_pwm_disable,
> +	.apply = gb_pwm_apply,
>  	.owner = THIS_MODULE,
>  };
>  
> diff --git a/include/linux/greybus/greybus_protocols.h b/include/linux/greybus/greybus_protocols.h
> index aeb8f9243545..81a6f16de098 100644
> --- a/include/linux/greybus/greybus_protocols.h
> +++ b/include/linux/greybus/greybus_protocols.h
> @@ -812,8 +812,8 @@ struct gb_pwm_deactivate_request {
>  
>  struct gb_pwm_config_request {
>  	__u8	which;
> -	__le32	duty;
> -	__le32	period;
> +	__u64	duty;
> +	__u64	period;
>  } __packed;

Did you just change a greybus protocol message that is sent over the
wire?  Why?  And why drop the endian marking of it?

Are you sure this is ok?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
