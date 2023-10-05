Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 439C47BA2FA
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 17:50:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 55C033F94D
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 15:50:05 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 117103F94C
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 15:49:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=GXBTjE5g;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8716ECE236E;
	Thu,  5 Oct 2023 15:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2ED6C433C7;
	Thu,  5 Oct 2023 15:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696520994;
	bh=TgPbPYBbJgwN2oCLX+Lek+y4/6PbdViurSWD0n2UUTg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GXBTjE5gcUOHNxnIq2aL4LwOXH3opTV19XdUTtUj4UaTYQbniCOzPF5+bIOEKOGDp
	 O60nUydPsMA8dhvY6hZUf6U4SK2dZIlj1Rh280yt8FA9eleWLzAJAHSA0tBomwvk7H
	 ww3OJdfEW7U28QCt+PirZy5WMTly3xtVySAdefEbN/SMAwv4w+8f1K44kdPm9zTrHp
	 huZfXvVTc5OSGb2Ar8kCQtik+FSlQx1xvxIyPewZRDEFfeTBYI51xxVA+svQfnMzLL
	 Kbcs7sqCna7Uy0m2JLICkHjrKFOdwEUmbeQTsupYFs9aKlH0Wd//w9sffr40fToyYA
	 qyjGkagqlXghw==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1qoQc7-0004cK-2T;
	Thu, 05 Oct 2023 17:50:11 +0200
Date: Thu, 5 Oct 2023 17:50:11 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZR7bMwe8k3RR6CuL@hovoldconsulting.com>
References: <2023100533-broadband-hunk-9e91@gregkh>
 <2023100534-showoff-alright-6c95@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2023100534-showoff-alright-6c95@gregkh>
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:sin.source.kernel.org:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 117103F94C
Message-ID-Hash: FTYAWLWIY3QTRLMZXM7CPPDQQZTW4CMS
X-Message-ID-Hash: FTYAWLWIY3QTRLMZXM7CPPDQQZTW4CMS
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: authentication: make cap_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FTYAWLWIY3QTRLMZXM7CPPDQQZTW4CMS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 05, 2023 at 03:58:35PM +0200, Greg Kroah-Hartman wrote:
> Now that the driver core allows for struct class to be in read-only
> memory, making all 'class' structures to be declared at build time
> placing them into read-only memory, instead of having to be dynamically
> allocated at load time.
> 
> Cc: Johan Hovold <johan@kernel.org>
> Cc: Alex Elder <elder@kernel.org>
> Cc: greybus-dev@lists.linaro.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Reviewed-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
