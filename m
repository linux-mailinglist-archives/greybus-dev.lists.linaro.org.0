Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E267A91751
	for <lists+greybus-dev@lfdr.de>; Thu, 17 Apr 2025 11:09:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EDE7E475FD
	for <lists+greybus-dev@lfdr.de>; Thu, 17 Apr 2025 09:09:50 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id AAB5C475E2
	for <greybus-dev@lists.linaro.org>; Thu, 17 Apr 2025 09:09:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="NxCs0+A/";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 526B56842A;
	Thu, 17 Apr 2025 09:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 102F3C4CEE4;
	Thu, 17 Apr 2025 09:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880983;
	bh=ft3blv+xedgR2GjguyCK+HIe9PLy7Z/DG7T7oPjuxhc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NxCs0+A/RqRfOW6jkO7V5w22jGjIKNQM2inSDo8ptkkV0w46XVtq4ruWvQka2yeNT
	 jKoQnbF0INwy/nnKn3ijL8Zxuil1LFuQmkBJq5aRkROTHMlzrjFvUqBKKn/fmBnI1l
	 dTMICvvfagSOM5i+3+o3YGCbWqlMSXp9fZNys1gs=
Date: Thu, 17 Apr 2025 11:09:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
Message-ID: <2025041701-purgatory-thievish-3e79@gregkh>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
 <20250413073220.15931-4-ganeshkpittala@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413073220.15931-4-ganeshkpittala@gmail.com>
X-Rspamd-Queue-Id: AAB5C475E2
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[172.105.4.254:from];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,animalcreek.com,nexus-software.ie];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: *
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: DQ6MH42G7PQ5XBPLYQYRJBZ4CUYPOGA7
X-Message-ID-Hash: DQ6MH42G7PQ5XBPLYQYRJBZ4CUYPOGA7
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 3/4] staging: greybus: refactor gb_loopback_fn into smaller helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DQ6MH42G7PQ5XBPLYQYRJBZ4CUYPOGA7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 13, 2025 at 07:32:19AM +0000, Ganesh Kumar Pittala wrote:
> This patch refactors the gb_loopback_fn() function in loopback.c by
> splitting large blocks of logic into well-named static helpers to
> improve clarity, readability, and maintainability.
> 
> The control flow remains unchanged. No functional modifications
> are introduced.
> 
> This aligns with kernel coding style guidelines for long functions
> and helps future contributors understand and modify loopback behavior
> more easily.
> 
> Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
> ---
>  drivers/staging/greybus/loopback.c | 152 ++++++++++++++++-------------
>  1 file changed, 82 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index c194afea941a..1e3644ede1b6 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -832,105 +832,117 @@ static void gb_loopback_async_wait_to_send(struct gb_loopback *gb)
>  				  kthread_should_stop());
>  }
>  
> -static int gb_loopback_fn(void *data)
> +static bool gb_loopback_should_stop(struct gb_loopback *gb,
> +				    struct gb_bundle *bundle)
> +{
> +	if (!gb->type) {
> +		gb_pm_runtime_put_autosuspend(bundle);
> +		wait_event_interruptible(gb->wq,
> +					 gb->type || kthread_should_stop());
> +		if (kthread_should_stop())
> +			return true;
> +		gb_pm_runtime_get_sync(bundle);
> +	}
> +	return kthread_should_stop();
> +}
> +
> +static void gb_loopback_handle_completion(struct gb_loopback *gb,
> +					  struct gb_bundle *bundle)
> +{
> +	gb_loopback_async_wait_all(gb);
> +
> +	mutex_lock(&gb->mutex);
> +	if (gb->iteration_count == gb->iteration_max) {
> +		gb->type = 0;
> +		gb->send_count = 0;
> +		sysfs_notify(&gb->dev->kobj, NULL, "iteration_count");
> +		dev_dbg(&bundle->dev, "load test complete\n");
> +	} else {
> +		dev_dbg(&bundle->dev, "continuing on with new test set\n");
> +	}
> +	mutex_unlock(&gb->mutex);
> +}
> +
> +static void gb_loopback_dispatch_operation(struct gb_loopback *gb, int type,
> +					   u32 size)
>  {
>  	int error = 0;
> -	int us_wait = 0;
> -	int type;
> -	int ret;
> -	u32 size;
>  
> +	if (gb->async) {
> +		if (type == GB_LOOPBACK_TYPE_PING)
> +			error = gb_loopback_async_ping(gb);
> +		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
> +			error = gb_loopback_async_transfer(gb, size);
> +		else if (type == GB_LOOPBACK_TYPE_SINK)
> +			error = gb_loopback_async_sink(gb, size);
> +
> +		if (error) {
> +			gb->error++;
> +			gb->iteration_count++;
> +		}
> +	} else {
> +		if (type == GB_LOOPBACK_TYPE_PING)
> +			error = gb_loopback_sync_ping(gb);
> +		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
> +			error = gb_loopback_sync_transfer(gb, size);
> +		else if (type == GB_LOOPBACK_TYPE_SINK)
> +			error = gb_loopback_sync_sink(gb, size);
> +
> +		if (error)
> +			gb->error++;
> +		gb->iteration_count++;
> +		gb_loopback_calculate_stats(gb, !!error);
> +	}
> +}
> +
> +static void gb_loopback_delay_if_needed(int us_wait)
> +{
> +	if (us_wait) {
> +		if (us_wait < 20000)
> +			usleep_range(us_wait, us_wait + 100);
> +		else
> +			msleep(us_wait / 1000);
> +	}
> +}
> +
> +static int gb_loopback_fn(void *data)
> +{
> +	int us_wait = 0, type;
> +	u32 size;
>  	struct gb_loopback *gb = data;
>  	struct gb_bundle *bundle = gb->connection->bundle;
>  
> -	ret = gb_pm_runtime_get_sync(bundle);
> -	if (ret)
> -		return ret;
> +	if (gb_pm_runtime_get_sync(bundle))
> +		return -EIO;
>  
>  	while (1) {
> -		if (!gb->type) {
> -			gb_pm_runtime_put_autosuspend(bundle);
> -			wait_event_interruptible(gb->wq, gb->type ||
> -						 kthread_should_stop());
> -			ret = gb_pm_runtime_get_sync(bundle);
> -			if (ret)
> -				return ret;
> -		}
> -
> -		if (kthread_should_stop())
> +		if (gb_loopback_should_stop(gb, bundle))
>  			break;
>  
> -		/* Limit the maximum number of in-flight async operations */

Why is it ok to remove this comment?

And why was this function broken up?  Is it confusing such that it now
needs subfunctions that are only called once?  Now you have to jump
around to follow the logic of this big while(1) loop, making it harder
to follow.

Remember, we write code for people first, compilers second, and I think
you just made it harder for people to manage this code over time as it
now takes extra work to determine how it all fits together.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
