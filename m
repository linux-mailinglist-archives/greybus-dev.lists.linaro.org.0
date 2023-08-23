Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B257851E6
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 09:45:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE79C44048
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 07:45:08 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id DFC7E43FE8
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 07:45:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=JRILnif7;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 79DAE651DC;
	Wed, 23 Aug 2023 07:45:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE2DC433C7;
	Wed, 23 Aug 2023 07:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692776700;
	bh=Fx0FPACDZXSbXtney/v4smWbDcLrEcVygc6uYCB9xmI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JRILnif71r4tPyGbEGyStZadyAPkiJdmqY8dzM1hbKydDOcDT7r5/VUmM8zLgCWFv
	 g0NjRTluZHcrxTaqxfaEHPHKjEGBUmNFeSGoYlPEr0X4a1fGYyD6m4bvMfHJPSYoA1
	 v8yO/Rs5g4F9P9iAce3GZwtB3/qDxfI02jj+n0RaqzV65fIWTbLn/oN8cJXbBUVitI
	 i5ro3fR+BiRPO66nSSDfMn5B+DXhvK0x0HyMmFm6BOD6sOxgXvEyo4uQ2e84gJoNme
	 CzTkB+c0XiuTOzo772LoELsrjIh+qUjNayK73gOld5h+o7grB+EFdwme1t2SSZY54B
	 ySxhk9ysOp2Lw==
Received: from johan by theta with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qYiXw-00088f-0z;
	Wed, 23 Aug 2023 09:44:56 +0200
Date: Wed, 23 Aug 2023 09:44:56 +0200
From: Johan Hovold <johan@kernel.org>
To: Yue Haibing <yuehaibing@huawei.com>
Message-ID: <ZOW4-OycWzNXdZDq@hovoldconsulting.com>
References: <20230818124338.37880-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818124338.37880-1-yuehaibing@huawei.com>
X-Rspamd-Queue-Id: DFC7E43FE8
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 4MOGTMERCD4TP6FUUEQXZTWSFKAC3ONW
X-Message-ID-Hash: 4MOGTMERCD4TP6FUUEQXZTWSFKAC3ONW
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH -next] greybus: svc: Remove unused declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4MOGTMERCD4TP6FUUEQXZTWSFKAC3ONW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 18, 2023 at 08:43:38PM +0800, Yue Haibing wrote:
> Commit 84427943d2da ("greybus: svc: drop legacy-protocol dependency")
> removed these implementations but not the declarations.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  include/linux/greybus/svc.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/include/linux/greybus/svc.h b/include/linux/greybus/svc.h
> index 5afaf5f06856..da547fb9071b 100644
> --- a/include/linux/greybus/svc.h
> +++ b/include/linux/greybus/svc.h
> @@ -100,7 +100,4 @@ bool gb_svc_watchdog_enabled(struct gb_svc *svc);
>  int gb_svc_watchdog_enable(struct gb_svc *svc);
>  int gb_svc_watchdog_disable(struct gb_svc *svc);
>  
> -int gb_svc_protocol_init(void);
> -void gb_svc_protocol_exit(void);
> -
>  #endif /* __SVC_H */

Yup, these are long gone:

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
