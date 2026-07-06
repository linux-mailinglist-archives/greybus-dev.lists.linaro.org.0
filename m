Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5GChLPR1S2pKRwEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 06 Jul 2026 11:31:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4363070E9F6
	for <lists+greybus-dev@lfdr.de>; Mon, 06 Jul 2026 11:31:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=linuxfoundation.org header.s=korg header.b=WZS2PBGk;
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=linuxfoundation.org (policy=none);
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org"
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AEFF340A7B
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Jul 2026 09:26:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 55BBB3F900
	for <greybus-dev@lists.linaro.org>; Mon,  6 Jul 2026 09:25:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C7A641728;
	Mon,  6 Jul 2026 09:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF84C1F00A3A;
	Mon,  6 Jul 2026 09:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783329955;
	bh=+AVN11LxM6caJv4yRaBWDnXch63tLQ2bvgSlV7NhJ58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WZS2PBGkRQwNBDsZAvMRfqnkJDd/sKK1Du9yw/8sN2DmiBXgwycbEZmyqjrdeeb9c
	 I7L/dcUnawBH07xPEBmag5myFUSMf9ykyOBD9cZUlWB6PBM2XqOdAiDTy6+0jJ+Axt
	 Jo1L68LFGTW5cXtVSgXBsYpQP5PnWNFoAuzOyWAw=
Date: Mon, 6 Jul 2026 11:26:04 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Message-ID: <2026070649-unpaid-symphonic-bed3@gregkh>
References: <20260706091935.78020-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706091935.78020-1-pengpeng@iscas.ac.cn>
X-Spamd-Bar: /
Message-ID-Hash: YKLMLNW6V7ARQB47ZESGSTGSLPXLBOUJ
X-Message-ID-Hash: YKLMLNW6V7ARQB47ZESGSTGSLPXLBOUJ
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: manifest: validate string descriptor header
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YKLMLNW6V7ARQB47ZESGSTGSLPXLBOUJ/>
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
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:pengpeng@iscas.ac.cn,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:-];
	RCPT_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[iscas.ac.cn:email,linaro.org:email,lists.linaro.org:from_smtp,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4363070E9F6

On Mon, Jul 06, 2026 at 05:19:35PM +0800, Pengpeng Hou wrote:
> identify_descriptor() computes a string descriptor size from
> desc->string.length.
> 
> Require the descriptor to contain the fixed string descriptor header
> before reading the variable string length. The existing descriptor-size
> check then reports the short descriptor.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  drivers/greybus/manifest.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/greybus/manifest.c b/drivers/greybus/manifest.c
> index 9be5d95da587..3b685ace2036 100644
> --- a/drivers/greybus/manifest.c
> +++ b/drivers/greybus/manifest.c
> @@ -122,6 +122,8 @@ static int identify_descriptor(struct gb_interface *intf,
>  	switch (desc_header->type) {
>  	case GREYBUS_TYPE_STRING:
>  		expected_size += sizeof(struct greybus_descriptor_string);
> +		if (desc_size < expected_size)
> +			break;

Nice, but how was this tested?  How was it found?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
