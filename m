Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 19730C30CA6
	for <lists+greybus-dev@lfdr.de>; Tue, 04 Nov 2025 12:41:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D4A53F847
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Nov 2025 11:41:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 8EAD83F847
	for <greybus-dev@lists.linaro.org>; Tue,  4 Nov 2025 11:41:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=eGVWbZMR;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D372E419C7;
	Tue,  4 Nov 2025 11:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAD3BC116D0;
	Tue,  4 Nov 2025 11:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762256504;
	bh=44m6mwml3Tdv2Z1Hfg8uDRMA/9cnRllsm0wLpVSTekU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eGVWbZMRVhKbxMB6G4ldOVIKdQb+xvgfMlgVNNTICSgYT6/kevGWUxUSc3Hwd7TrZ
	 ou83Ft1s5ib/sbgWaUal7Y5+lCV226SKo214TprAe/bONqHIbXDLMyIi4QsD03Joem
	 mgBX1+TwX8/KZM+M/gsXW672CCjMVY/G05gSk86Vs51Zd8HED4VZ8ypgD6TO0NCGK0
	 q3C325AGFru5HEkJCIks1lYsJ9WVr7ufYmEv3o92hZlgElhKgfCaAwDat5CCvmQP3v
	 2g4R6CAI6jFOwhY9m8QdluWLUcT8BLX3wnzTVpgWZE0YQfbtBr7uYlDDXzzW1j+y6H
	 HJkfhnzai1/cg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vGFQ4-000000007mh-0SGd;
	Tue, 04 Nov 2025 12:41:48 +0100
Date: Tue, 4 Nov 2025 12:41:48 +0100
From: Johan Hovold <johan@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Message-ID: <aQnmfCKoB3FJ5Jz8@hovoldconsulting.com>
References: <b542b028-4f9b-44cd-aca7-5d4977c2faa4@web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b542b028-4f9b-44cd-aca7-5d4977c2faa4@web.de>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8EAD83F847
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.98 / 15.00];
	BAYES_HAM(-2.98)[99.93%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FREEMAIL_TO(0.00)[web.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,kernel.org,linuxfoundation.org,vger.kernel.org,animalcreek.com,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,172.234.252.31:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: G46IQIH7FIKWUFZ3CCO4MLP3BPXPD7UX
X-Message-ID-Hash: G46IQIH7FIKWUFZ3CCO4MLP3BPXPD7UX
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Miaoqian Lin <linmq006@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: es2: Use pointer from memcpy() call for assignment in output_async()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G46IQIH7FIKWUFZ3CCO4MLP3BPXPD7UX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 31, 2025 at 07:57:47PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Fri, 31 Oct 2025 19:50:39 +0100
> 
> A pointer was assigned to a variable. The same pointer was used for
> the destination parameter of a memcpy() call.
> This function is documented in the way that the same value is returned.
> Thus convert two separate statements into a direct variable assignment for
> the return value from a memory copy action.

Markus, stop sending these kind of crap patches that just wastes other
people's time. You've had a number of maintainers reviewing the latest
batch (including patches which apparently does not even compile) all
telling you the same thing.

> The source code was transformed by using the Coccinelle software.

Since you know how to work with Coccinelle, at least try to come up with
something that fixes actual bugs.

Johan
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
