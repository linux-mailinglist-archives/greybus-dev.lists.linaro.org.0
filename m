Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D9336C6412A
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Nov 2025 13:33:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B7F6B3F8F6
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Nov 2025 12:33:32 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 6F9B73F689
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 12:33:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=iHiWmoRK;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BD8A840BAB;
	Mon, 17 Nov 2025 12:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 522E6C113D0;
	Mon, 17 Nov 2025 12:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763382804;
	bh=gYCBn1KE6BBmJnCrBauL9Eq9EEei93TQ1lw2gCaB2I4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iHiWmoRKR9YhO4u7Wr7OSVUrmdTc72c/x//sxxdSDspj7dfapHzKO6HwzGFc49uTS
	 cQHdQCHDeo9DU2XuwQIjCtTgvhQBif34W3gmAD4aw70hKw3FXbbVNaDoH8QWip+ap/
	 EX8h2dj0NZx0fx2Q0//sSA4z0Y4CvMm/xVSYkjIs=
Date: Mon, 17 Nov 2025 07:33:21 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Message-ID: <2025111706-glacial-lantern-337e@gregkh>
References: <20251117065003.7453-1-dharanitharan725@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117065003.7453-1-dharanitharan725@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.234.252.31:from];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6F9B73F689
X-Spamd-Bar: /
Message-ID-Hash: XVVHX6PC2SLQ7BMJJWGBHRGJSDF5TUV7
X-Message-ID-Hash: XVVHX6PC2SLQ7BMJJWGBHRGJSDF5TUV7
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XVVHX6PC2SLQ7BMJJWGBHRGJSDF5TUV7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 06:50:03AM +0000, Dharanitharan R wrote:
> The sample userspace firmware-management tool uses strncpy() to copy
> firmware tags. strncpy() does not guarantee null-termination and can
> leave buffers unterminated. For userspace code, strlcpy() is the
> recommended safe alternative.
> 
> Replace all strncpy() calls with strlcpy().
> 
> Signed-off-by: Dharanitharan <dharanitharan725@gmail.com>
> ---
>  .../greybus/Documentation/firmware/firmware.c      | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
> index 3b35ef6d4adb..224eb8f4e39c 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware.c
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
> @@ -63,8 +63,9 @@ static int update_intf_firmware(int fd)
>  	intf_load.major = 0;
>  	intf_load.minor = 0;
>  
> -	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
> -		GB_FIRMWARE_U_TAG_MAX_SIZE);
> +    strlcpy(intf_load.firmware_tag, firmware_tag,
> +       GB_FIRMWARE_U_TAG_MAX_SIZE);
> +

What happened to the indentation?

:(

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
