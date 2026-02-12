Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHF6GkW/jWkZ6gAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 12:53:41 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0203812D31B
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 12:53:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9528B3F90B
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Feb 2026 11:44:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id CD45D3F770
	for <greybus-dev@lists.linaro.org>; Thu, 12 Feb 2026 11:44:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b="EK6D7/Ka";
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3FEFC4186D;
	Thu, 12 Feb 2026 11:44:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F29C4CEF7;
	Thu, 12 Feb 2026 11:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770896641;
	bh=COqFDVwFejhkDY7wmu6jH5HxN2D2fR2JAI/imf3tAGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EK6D7/Ka8XrBSIu/NTsdGwCrXQLR6HuWB6bKUuGZMBcxO7hIY/qfyM+7YMPdtY/5W
	 ShbdggaYLBESe5bAu8YLcLj2x7AtFaNcs8twaL1gxhbg6AtYimcHItCeY3zDOm8XQX
	 rbQ+CL3QN/lxy+WA/m5JTSsMhABYqHhwTUivXzDM=
Date: Thu, 12 Feb 2026 12:43:57 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Message-ID: <2026021222-fondue-celtic-0e2a@gregkh>
References: <aYz8aUyx9W_IZD3F@fedora>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aYz8aUyx9W_IZD3F@fedora>
X-Spamd-Bar: /
Message-ID-Hash: 5DEWQJQ7IQZ6CNGJ4VZYRT2MVEGDCPDN
X-Message-ID-Hash: 5DEWQJQ7IQZ6CNGJ4VZYRT2MVEGDCPDN
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: PATCH 1/1: greybus/usb: handle unspecified lengths in hub_control
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5DEWQJQ7IQZ6CNGJ4VZYRT2MVEGDCPDN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [5.09 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	R_DKIM_REJECT(1.00)[linuxfoundation.org:s=korg];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 0203812D31B
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 11:02:17PM +0100, Jose A. Perez de Azpillaga wrote:
> >From 1e099b581fe475905509b9d600015ea2500b8cf8 Mon Sep 17 00:00:00 2001
> From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
> Date: Wed, 11 Feb 2026 22:54:40 +0100
> Subject: [PATCH] greybus/usb: handle unspecified lengths in hub_control

Something went wrong with your email client to include this in the
changelog area.  Perhaps use git send-email instead?

> 
> Fixes the FIXME in hub_control where response length was not handled correctly.

Can you wrap these lines at 72 columns like the editor asks?

> 
> Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
> ---
>  drivers/staging/greybus/usb.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
> index 475f24f20cd4..f5f5a4863ddc 100644
> --- a/drivers/staging/greybus/usb.c
> +++ b/drivers/staging/greybus/usb.c
> @@ -105,8 +105,10 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>  	size_t response_size;
>  	int ret;
>  
> -	/* FIXME: handle unspecified lengths */
> -	response_size = sizeof(*response) + wLength;
> +	/* Calculate expected response size */
> +	response_size = sizeof(*response);
> +	if (wLength)
> +		response_size += wLength;

How is this handling an unspecified length?


>  
>  	operation = gb_operation_create(dev->connection,
>  					GB_USB_TYPE_HUB_CONTROL,
> @@ -127,9 +129,13 @@ static int hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue, u16 wIndex,
>  		goto out;
>  
>  	if (wLength) {
> -		/* Greybus core has verified response size */
> -		response = operation->response->payload;
> -		memcpy(buf, response->buf, wLength);
> +		size_t actual_size = operation->response->payload_size - sizeof(*response);
> +		size_t copy_size = min(wLength, actual_size);
> +
> +		if (copy_size) {
> +			response = operation->response->payload;
> +			memcpy(buf, response->buf, copy_size);
> +		}

Sorry, but I do not understand this change.  How was this tested?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
