Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FP2zOJTATGqxpAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 07 Jul 2026 11:02:12 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE9A71976D
	for <lists+greybus-dev@lfdr.de>; Tue, 07 Jul 2026 11:02:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b="d/7d1mIk";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78280404FD
	for <lists+greybus-dev@lfdr.de>; Tue,  7 Jul 2026 09:02:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 446C83F720
	for <greybus-dev@lists.linaro.org>; Tue,  7 Jul 2026 09:01:27 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6889041471;
	Tue,  7 Jul 2026 09:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6071F000E9;
	Tue,  7 Jul 2026 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783414886;
	bh=6raVjvi3XDmAui1gkysk51ynAxJsWrL+QzELOj6V6sY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=d/7d1mIkXHsAGC+cG8yeAfuzkdkYiNZqfHjbdxm8xHccv0BjzJl5i6e4Fn+hUV7L0
	 kJj8bOiu6t/K8Nnd3kdInQU1jRiInX1iTlwobxOOO3lQdvVM0xq2umj4gON/6zqrqd
	 vOi2yusqfJ9HgCzEYV8WhS8qwY6/o3sKmAfkFY7M=
Date: Tue, 7 Jul 2026 11:01:23 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Arnav Kapoor <kapoorarnav43@gmail.com>
Message-ID: <2026070754-lumber-raking-ea19@gregkh>
References: <20260622042721.31760-1-kapoorarnav43@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260622042721.31760-1-kapoorarnav43@gmail.com>
X-Spamd-Bar: /
Message-ID-Hash: J4YQBVWD7YCMEZZI7R57CQS64JQI5WCT
X-Message-ID-Hash: J4YQBVWD7YCMEZZI7R57CQS64JQI5WCT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [staging] staging: greybus: loopback: add missing comment for mutex
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J4YQBVWD7YCMEZZI7R57CQS64JQI5WCT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:kapoorarnav43@gmail.com,m:johan@kernel.org,m:linux-staging@lists.linux.dev,m:greybus-dev@lists.linaro.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[greybus-dev-bounces@lists.linaro.org:query timed out];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,linuxfoundation.org:from_mime,gregkh:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8FE9A71976D

On Mon, Jun 22, 2026 at 09:57:21AM +0530, Arnav Kapoor wrote:
> Add a comment for the mutex as suggested by checkpatch.
> 
> Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>

The subject line should have [PATCH] in it, right?

> ---
>  drivers/staging/greybus/loopback.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
> index ea57b1f5d..bf827e672 100644
> --- a/drivers/staging/greybus/loopback.c
> +++ b/drivers/staging/greybus/loopback.c
> @@ -61,7 +61,7 @@ struct gb_loopback {
>  
>  	struct dentry *file;
>  	struct kfifo kfifo_lat;
> -	struct mutex mutex;
> +	struct mutex mutex;		/* protects the entire structure */

Look on the mailing list for other places where this type of change was
rejected as it doesn't really explain anything.

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
