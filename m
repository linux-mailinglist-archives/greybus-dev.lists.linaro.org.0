Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BE1C6A76A
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 17:00:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D52F3F903
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 16:00:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 4B3A33F690
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 16:00:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Fgo4pJXR;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DDD8460B51;
	Tue, 18 Nov 2025 16:00:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B1F4C2BCB0;
	Tue, 18 Nov 2025 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763481621;
	bh=HYFduRKlUVxpF9liS457vIulzhRckMd7kUkI8sUps6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fgo4pJXREWFmaCnTqCiQe2F89hK9gqpFu0DzvrtZHSQseT7xTwEMkbTnExuf5RyB9
	 olIWorNkhyEnp2mJTVyHIYPWnJPR6CT4VujCZOMMI1k6GlnDkRRJjmbGcGUAuWd1/L
	 PdikaWtUbu92AsVIViEgkTkNevgnmRIgoo8QrLcDyoJ65Ni6DV920nUOQYO8epRfCs
	 cCZJn9w4YG4P99NMme+peNa0eGE0YG4I4YHe3qAMlkO4SSeNeBvPLV0rqrIArNC7U4
	 OfU6O/83Rv8dxLtBxU+RNEDzaVjJ521rL+8T5Pi6czd+vnso+NccIBbxpnd/UCx5kv
	 WIxFe9+2esaWw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vLO7v-0000000038H-1olV;
	Tue, 18 Nov 2025 17:00:19 +0100
Date: Tue, 18 Nov 2025 17:00:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
Message-ID: <aRyYE_4hXmatrhhq@hovoldconsulting.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
 <20251117181818.118139-7-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117181818.118139-7-ayaanmirzabaig85@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.68 / 15.00];
	BAYES_HAM(-2.68)[98.60%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[tor.source.kernel.org:rdns,tor.source.kernel.org:helo,hovoldconsulting.com:mid];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4B3A33F690
X-Spamd-Bar: ---
Message-ID-Hash: XDVAJPQFPRTY4IBPTGP6CBJ2WPD5QIFC
X-Message-ID-Hash: XDVAJPQFPRTY4IBPTGP6CBJ2WPD5QIFC
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 06/13] staging: greybus: bootrom: remove obsolete FIXME about SVC parallel event handling
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XDVAJPQFPRTY4IBPTGP6CBJ2WPD5QIFC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 11:48:11PM +0530, Ayaan Mirza Baig wrote:
> The MODE_SWITCH_TIMEOUT_MS constant included a FIXME suggesting the timeout
> could be reduced once the SVC core supported parallel event processing.
> Greybus SVC logic is stable today and no such change is planned, and the
> existing timeout has been used reliably for years. Remove the 
> obsolete FIXME and replace it with a descriptive comment.

No, just leave the FIXME in place.
 
> -/*
> - * FIXME: Reduce this timeout once svc core handles parallel processing of
> - * events from the SVC, which are handled sequentially today.
> - */
> +/* Timeout for mode switching operations, based on current SVC behaviour */
>  #define MODE_SWITCH_TIMEOUT_MS	10000

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
