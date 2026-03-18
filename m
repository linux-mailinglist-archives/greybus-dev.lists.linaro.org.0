Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6P23ICvFumk8bwIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 16:30:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id F36C12BE3D9
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 16:30:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8D3A73F98A
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Mar 2026 15:30:49 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id DA82C3F903
	for <greybus-dev@lists.linaro.org>; Wed, 18 Mar 2026 15:30:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=H+3Anku+;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 758B660054;
	Wed, 18 Mar 2026 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD66BC19421;
	Wed, 18 Mar 2026 15:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773847846;
	bh=9zJlw4kpiIxtWq81fKqJ3Q0XaQlUBR8C97QCmbBYBb8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H+3Anku+i6N8mgnK/6X5nPhWDLtTP6emUkH+/HoatmUlfy5SLMqWOnrS1pS1YtYS0
	 BkASBaAF/NX+b1FL7NiQe3k+qAreS4uOZ414ViJ4pUTb+JiOvnECdk25O3m/6eFi4S
	 xCDIcvduCAwe94hfjRpFfnJQ8FzKVCeEujUGyUuc=
Date: Wed, 18 Mar 2026 16:30:41 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Rahul Joshi <rj5547884@gmail.com>
Message-ID: <2026031856-dormitory-chamber-91d5@gregkh>
References: <20260311175334.464391-1-rj5547884@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311175334.464391-1-rj5547884@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: JS36QZXJLSQHVZDQAF2LINVFGQNI5MHH
X-Message-ID-Hash: JS36QZXJLSQHVZDQAF2LINVFGQNI5MHH
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: gpio: add comment to mutex definition
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JS36QZXJLSQHVZDQAF2LINVFGQNI5MHH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	NEURAL_SPAM(0.00)[0.358];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: F36C12BE3D9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 11:23:34PM +0530, Rahul Joshi wrote:
> The irq_lock mutex is missing a comment describing what it protects,
> which is required by kernel coding style. Add a comment clarifying
> that it serializes IRQ bus lock/unlock operations used to defer and
> sync pending IRQ type and mask changes to hardware.
> 
> Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
> ---
>  drivers/staging/greybus/gpio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 12185f7a982c..89c15b804b2a 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -39,7 +39,7 @@ struct gb_gpio_controller {
>  
>  	struct gpio_chip	chip;
>  	struct irq_chip		irqc;
> -	struct mutex		irq_lock;
> +	struct mutex		irq_lock;	/* protects irq bus operations */

What is a "irq bus"?  This comment feels odd to me :(

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
