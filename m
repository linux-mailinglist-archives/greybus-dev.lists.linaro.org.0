Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6B7C66E2F
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 02:51:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0AA163F900
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 01:51:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id C334D3F7B1
	for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 01:51:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=2YIcl1l3;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 544A4605D9;
	Tue, 18 Nov 2025 01:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E5BC2BCB3;
	Tue, 18 Nov 2025 01:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763430677;
	bh=PhhemHjIlGFxfV76lFo2Appfowr6MVFmIh15iPudo8s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=2YIcl1l3VImwXKJMZmRS/0pBw2CnF9GTDqyB8Eq4E16O9iq2lfUOU6xupdpxzhBrC
	 iBJspOGehgxh1aoQ784lfovuXuLRKAFEu9cRqldHmcS+K2Hk8lLBWRQ2lthzD+elLF
	 8mChWW56KYqr3w2dR+1HPmZ4HwgIFjwG56wNorCU=
Date: Mon, 17 Nov 2025 20:51:14 -0500
From: Greg KH <gregkh@linuxfoundation.org>
To: Dharanitharan R <dharanitharan725@gmail.com>
Message-ID: <2025111747-sulphate-statue-1634@gregkh>
References: <20251117172133.10936-1-dharanitharan725@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251117172133.10936-1-dharanitharan725@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.52 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-2.98)[99.92%];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.0.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	URIBL_BLOCKED(0.00)[linuxfoundation.org:dkim,linuxfoundation.org:from_smtp,linuxfoundation.org:from_mime,tor.source.kernel.org:rdns,tor.source.kernel.org:helo,gregkh:mid];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C334D3F7B1
X-Spamd-Bar: /
Message-ID-Hash: 5EQ5YYWEVPO64A7ESEFESADCRRSMAECD
X-Message-ID-Hash: 5EQ5YYWEVPO64A7ESEFESADCRRSMAECD
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5EQ5YYWEVPO64A7ESEFESADCRRSMAECD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 17, 2025 at 05:21:33PM +0000, Dharanitharan R wrote:
> v2: Fix indentation issues pointed out by Greg KH.

No real changelog?  And this goes below the --- line, right?

> 
> Signed-off-by:Dharanitharan R <dharanitharan725@gmail.com>

You need a space after the :

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
