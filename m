Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EBFE9A91735
	for <lists+greybus-dev@lfdr.de>; Thu, 17 Apr 2025 11:03:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 120B6475E8
	for <lists+greybus-dev@lfdr.de>; Thu, 17 Apr 2025 09:03:39 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 090E7475C7
	for <greybus-dev@lists.linaro.org>; Thu, 17 Apr 2025 09:03:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=mmvAH2oN;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 202AF5C4B0B;
	Thu, 17 Apr 2025 09:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E36CC4CEE4;
	Thu, 17 Apr 2025 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744880608;
	bh=AKhbiaGFNz2s5vGu/XO3lm43YKVVOG8RMVknp1zupyo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mmvAH2oNnOd3X6U4mdB0Wn4cz4JSygFlJECoydO77lCviIErj1qQz5IVKmS6gIFBm
	 tCu+nNIdyyCGw5yZg9xQEDoaylmkgwzPqRkBGE8WT/r5QiDati8r88gD3dBfD2Flo7
	 O2Au+Gxqdcyvw+2SSeVWhxlVWjud+bCgrDYQOnQc=
Date: Thu, 17 Apr 2025 11:03:26 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
Message-ID: <2025041752-surviving-blandness-229e@gregkh>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
X-Rspamd-Queue-Id: 090E7475C7
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[139.178.84.217:from];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,animalcreek.com,nexus-software.ie];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: *
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: M66U7YESUGMYTGFW6PT4R3QXIOGPCBFT
X-Message-ID-Hash: M66U7YESUGMYTGFW6PT4R3QXIOGPCBFT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 0/4] staging: greybus: cleanup, API migration, and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M66U7YESUGMYTGFW6PT4R3QXIOGPCBFT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Apr 13, 2025 at 07:32:16AM +0000, Ganesh Kumar Pittala wrote:
> This patch series splits and improves the previously submitted single patch by
> breaking it into four independent, logical changes following kernel submission
> etiquette.
> 
> Link: https://lore.kernel.org/r/d683962c-e8b7-4adc-9902-483976197637@riscstar.com
> Link: https://lore.kernel.org/r/5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com
> Link: https://lore.kernel.org/r/4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com
> Link: https://lore.kernel.org/r/202504010829.vIzweYue-lkp@intel.com
> Link: https://lore.kernel.org/r/202504011217.iRb2Bbls-lkp@intel.com
> 
> All changes are isolated, reviewed, and tested.

How exactly did you test these?  What hardware was it run on?

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
