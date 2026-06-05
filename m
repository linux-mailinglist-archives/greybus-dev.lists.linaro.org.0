Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4gOsIo0lI2qyjQEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Jun 2026 21:37:49 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055864AFC2
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Jun 2026 21:37:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=ItFq8cco;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=kernel.org (policy=quarantine)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6EF65405C7
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Jun 2026 19:37:48 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 4158C3F827
	for <greybus-dev@lists.linaro.org>; Fri,  5 Jun 2026 19:37:42 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 020CD601DC;
	Fri,  5 Jun 2026 19:37:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D937E1F00899;
	Fri,  5 Jun 2026 19:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780688261;
	bh=H57hTL7cicJxLbyAuR8jC+VpeYQ3rhrMDw5nCOGDdBk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ItFq8ccoQ1KPs/vFdyuKadGIlyepcmoviQUFW2wgQ7du0zoDh0WLTXBNA4x4cWNJA
	 kw4WxGzshpAn/PcjqtOlAh2qlpsC+mhBwTQ1sQM/Cz/clXbb28lj6wqlRhlOOJoJS6
	 zg3LM4XCWIXyfnC8SaNwG4e83xTwDsoS5LaDpgYuJlOeopXtYr6cEY2OmcIzopOzem
	 ccM2SdYXxArychBvCPRPDFSvygkHRIMhhgVtLe/B0oS3MBQ8oFJ9FbjClzkQT5tUNg
	 PSmk8LKPNt+rbofBNkFJ+zW1xfDdHyT8PncCif6VqZP5Asv9uBVi9YV+9pt4sb49mz
	 vxBgUu/O5yY+w==
From: Sasha Levin <sashal@kernel.org>
To: lee@kernel.org,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <benjamin.tissoires@redhat.com>,
	=?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Ping Cheng <ping.cheng@wacom.com>,
	Jason Gerecke <jason.gerecke@wacom.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Fri,  5 Jun 2026 15:37:13 -0400
Message-ID: <20260605-stable-reply-0006@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260603163022.3301081-1-lee@kernel.org>
References: <20260603163022.3301081-1-lee@kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Message-ID-Hash: 6NCARANQM4SAJOCWOEA2A72VN64C7ESS
X-Message-ID-Hash: 6NCARANQM4SAJOCWOEA2A72VN64C7ESS
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sasha Levin <sashal@kernel.org>, stable@vger.kernel.org, Vicki Pfau <vi@endrift.com>, Jiri Kosina <jkosina@suse.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [linux-6.1.y 1/3] HID: core: Add printk_ratelimited variants to hid_warn() etc
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6NCARANQM4SAJOCWOEA2A72VN64C7ESS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:lee@kernel.org,m:jikos@kernel.org,m:benjamin.tissoires@redhat.com,m:lains@riseup.net,m:hadess@hadess.net,m:ping.cheng@wacom.com,m:jason.gerecke@wacom.com,m:vireshk@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:linux-input@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:sashal@kernel.org,m:stable@vger.kernel.org,m:vi@endrift.com,m:jkosina@suse.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[sashal@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6055864AFC2

> [linux-6.1.y 1/3] HID: core: Add printk_ratelimited variants to hid_warn() etc

Whole series queued for 6.1.y, thanks.

-- 
Thanks,
Sasha
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
