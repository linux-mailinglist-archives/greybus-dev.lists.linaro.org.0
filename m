Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3D2784458
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Aug 2023 16:32:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2AA83EA1B
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Aug 2023 14:32:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id A8AA23EA1B
	for <greybus-dev@lists.linaro.org>; Tue, 22 Aug 2023 14:32:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=Fp014mT0;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4A7DD62AB8;
	Tue, 22 Aug 2023 14:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E96C433C8;
	Tue, 22 Aug 2023 14:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1692714748;
	bh=EM9dUTqY0ids7+xie3FqnEpTZ2/WW77WHF1TTpHX1OU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fp014mT0BHy/W6TdZQ3ksrSxxV2gR1PvkCoLJ1d6MbBfjLWkOTscNXBck4GqecVku
	 flb362LY1ETdzc5UMrULOvqQ+DbOFaJaXa/YmBzLedCvVDyG0zYdiYZ2aLoysit67U
	 Sk/ipo3dT7e6jZhXBK/WKTSCB6BlHjom/YEXHlew=
Date: Tue, 22 Aug 2023 16:32:25 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yue Haibing <yuehaibing@huawei.com>
Message-ID: <2023082220-washbowl-shed-6be9@gregkh>
References: <20230818124338.37880-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818124338.37880-1-yuehaibing@huawei.com>
X-Rspamd-Queue-Id: A8AA23EA1B
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	DWL_DNSWL_HI(-3.50)[linuxfoundation.org:dkim];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: AXLZ65MHFDFMSI4ZFZNZW2HDNLYZDWXC
X-Message-ID-Hash: AXLZ65MHFDFMSI4ZFZNZW2HDNLYZDWXC
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH -next] greybus: svc: Remove unused declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AXLZ65MHFDFMSI4ZFZNZW2HDNLYZDWXC/>
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
> -- 
> 2.34.1
> 

Nice, how did you find these?
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
