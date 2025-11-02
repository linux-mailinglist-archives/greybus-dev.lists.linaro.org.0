Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BADD3C28E45
	for <lists+greybus-dev@lfdr.de>; Sun, 02 Nov 2025 12:41:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D00A23F821
	for <lists+greybus-dev@lfdr.de>; Sun,  2 Nov 2025 11:41:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 401D33F778
	for <greybus-dev@lists.linaro.org>; Sun,  2 Nov 2025 11:41:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=U6WyvpWB;
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8F459601F6;
	Sun,  2 Nov 2025 11:41:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE25FC4CEF7;
	Sun,  2 Nov 2025 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1762083671;
	bh=7Y2IuLJRtMT2L8zTsIwTSwa32kNtXQ3ENuF6e8GwQZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U6WyvpWBHni/fc57swCngaZNw6qvSPIqnov9TOBpnA763IgVvEf+Jt+W1VppmdCQt
	 Srlf+6sOH0U1BlNqDCfQVHTxPtpV38b3gy46roqE10DN/9dBvClq8OUAXw5cxSeeJs
	 /lHTyx4CH4SRs7l61YjfbDcDbkxCFlvGlxC3gvds=
Date: Sun, 2 Nov 2025 20:41:08 +0900
From: Greg KH <gregkh@linuxfoundation.org>
To: zntsproj <vacacax16@gmail.com>
Message-ID: <2025110254-identical-tactful-a48a@gregkh>
References: <20251102113938.3116-1-vseokaktusah7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251102113938.3116-1-vseokaktusah7@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 401D33F778
X-Spamd-Bar: /
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,tor.source.kernel.org:rdns,tor.source.kernel.org:helo];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.105.4.254:from];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
Message-ID-Hash: 7N3CTC6D22ON2LMICL7UVWAGFB7SDIZE
X-Message-ID-Hash: 7N3CTC6D22ON2LMICL7UVWAGFB7SDIZE
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, zntsproj <vseokaktusah7@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4] Fix tiny typo in firmware-management docs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7N3CTC6D22ON2LMICL7UVWAGFB7SDIZE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 02, 2025 at 02:39:38PM +0300, zntsproj wrote:
> Signed-off-by: zntsproj <vseokaktusah7@gmail.com>
> ---
>  .../staging/greybus/Documentation/firmware/firmware-management  | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/Documentation/firmware/firmware-management b/drivers/staging/greybus/Documentation/firmware/firmware-management
> index 7918257e5..393455557 100644
> --- a/drivers/staging/greybus/Documentation/firmware/firmware-management
> +++ b/drivers/staging/greybus/Documentation/firmware/firmware-management
> @@ -193,7 +193,7 @@ Identifying the Character Device
>  
>  There can be multiple devices present in /dev/ directory with name
>  gb-authenticate-N and user first needs to identify the character device used for
> -authentication a of particular interface.
> +authentication of a particular interface.
>  
>  The Authentication core creates a device of class 'gb_authenticate', which shall
>  be used by the user to identify the right character device for it. The class
> -- 
> 2.51.2
> 
> 

Why did you ignore my bot's recommendations?
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
